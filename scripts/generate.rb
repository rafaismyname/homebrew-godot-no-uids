#!/usr/bin/env ruby
# frozen_string_literal: true

# Renders the "latest" and pinned Cask + Formula files for one godot-no-uids
# release. Used both by the CI workflow (one release at a time) and by the
# one-off backfill script (looped over release history).
#
# Usage:
#   ruby scripts/generate.rb --version 4.7.1 --tag 4.7.1-stable-nouid \
#     --sha-macos <hex> --sha-linux <hex>

require "optparse"
require "fileutils"

options = {}
OptionParser.new do |parser|
  parser.on("--version VERSION") { |v| options[:version] = v }
  parser.on("--tag TAG") { |v| options[:tag] = v }
  parser.on("--sha-macos SHA") { |v| options[:sha_macos] = v }
  parser.on("--sha-linux SHA") { |v| options[:sha_linux] = v }
end.parse!

%i[version tag sha_macos sha_linux].each do |key|
  raise OptionParser::MissingArgument, "--#{key.to_s.tr('_', '-')}" unless options[key]
end

VERSION = options[:version]
TAG = options[:tag]
SHA_MACOS = options[:sha_macos]
SHA_LINUX = options[:sha_linux]

REPO = "rafaismyname/godot-no-uids"
LINUX_ASSET = "godot-#{TAG}-Linux"
LINUX_URL = "https://github.com/#{REPO}/releases/download/#{TAG}/#{LINUX_ASSET}"

ROOT = File.expand_path("..", __dir__)

# Reproduces Homebrew::Formulary.class_s so generated class names match what
# `brew` itself derives from the token (e.g. "godot-no-uids@4.7.1" -> "GodotNoUidsAT471").
def formula_class_name(token)
  name = token.capitalize
  name = name.gsub(/[-_.\s]([a-zA-Z0-9])/) { Regexp.last_match(1).upcase }
  name = name.tr("+", "x")
  name.sub(/(.)@(\d)/, '\1AT\2')
end

def cask_content(token:, version:, sha_macos:, pinned:)
  app_name = pinned ? "Godot-No-UID-#{version}.app" : "Godot.app"
  binary_target = pinned ? token : "godot"
  desc = pinned ? "Game engine with UID generation disabled by default (pinned to #{version})" \
                : "Game engine with UID generation disabled by default"

  livecheck_block = pinned ? "skip \"Pinned version, not auto-updated\"" \
                            : "url :url\n    strategy :github_latest"

  conflicts_line = pinned ? "" : "\n  conflicts_with cask: \"godot\""
  app_line = pinned ? "app \"Godot.app\", target: \"#{app_name}\"" : "app \"Godot.app\""

  <<~RUBY
    cask "#{token}" do
      version "#{version}"
      sha256 "#{sha_macos}"

      url "https://github.com/#{REPO}/releases/download/\#{version}-stable-nouid/godot.macos.editor.zip"
      name "Godot Engine (No UID)"
      desc "#{desc}"
      homepage "https://github.com/#{REPO}"

      livecheck do
        #{livecheck_block}
      end
    #{conflicts_line}
      depends_on macos: :big_sur

      #{app_line}
      binary "\#{appdir}/#{app_name}/Contents/MacOS/Godot", target: "#{binary_target}"

      postflight do
        system_command "/usr/bin/xattr", args: ["-cr", "\#{appdir}/#{app_name}"]
      end

      zap trash: [
        "~/Library/Application Support/Godot",
        "~/Library/Caches/Godot",
        "~/Library/Saved Application State/org.godotengine.godot.savedState",
      ]
    end
  RUBY
end

def formula_content(token:, version:, sha_linux:, linux_url:, linux_asset:, pinned:)
  class_name = formula_class_name(token)
  desc = pinned ? "Godot Engine with UID generation disabled by default (pinned to #{version})" \
                : "Godot Engine with UID generation disabled by default"
  livecheck_block = pinned ? "skip \"Pinned version, not auto-updated\"" \
                            : "url :stable\n    strategy :github_latest"
  keg_only_line = pinned ? "\n  keg_only :versioned_formula\n" : ""

  <<~RUBY
    class #{class_name} < Formula
      desc "#{desc}"
      homepage "https://github.com/#{REPO}"
      url "#{linux_url}"
      sha256 "#{sha_linux}"
      license "MIT"

      livecheck do
        #{livecheck_block}
      end
    #{keg_only_line}
      def install
        bin.install "#{linux_asset}" => "#{token}"
        chmod "+x", bin/"#{token}"
      end

      test do
        system bin/"#{token}", "--version"
      end
    end
  RUBY
end

def write(path, content)
  FileUtils.mkdir_p(File.dirname(path))
  File.write(path, content)
  puts "wrote #{path}"
end

write("#{ROOT}/Casks/godot-no-uids.rb",
      cask_content(token: "godot-no-uids", version: VERSION, sha_macos: SHA_MACOS, pinned: false))
write("#{ROOT}/Casks/godot-no-uids@#{VERSION}.rb",
      cask_content(token: "godot-no-uids@#{VERSION}", version: VERSION, sha_macos: SHA_MACOS, pinned: true))

write("#{ROOT}/Formula/godot-no-uids.rb",
      formula_content(token: "godot-no-uids", version: VERSION, sha_linux: SHA_LINUX, linux_url: LINUX_URL, linux_asset: LINUX_ASSET, pinned: false))
write("#{ROOT}/Formula/godot-no-uids@#{VERSION}.rb",
      formula_content(token: "godot-no-uids@#{VERSION}", version: VERSION, sha_linux: SHA_LINUX, linux_url: LINUX_URL, linux_asset: LINUX_ASSET, pinned: true))
