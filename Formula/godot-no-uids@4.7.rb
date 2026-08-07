class GodotNoUidsAT47 < Formula
  desc "Godot Engine with UID generation disabled by default (pinned to 4.7)"
  homepage "https://github.com/rafaismyname/godot-no-uids"
  url "https://github.com/rafaismyname/godot-no-uids/releases/download/4.7-stable-nouid/godot-4.7-stable-nouid-Linux"
  sha256 "ff33f5bd1fccd202570e582ecea6854baaffc30d4cb4094108216671e7c38473"
  license "MIT"

  livecheck do
    skip "Pinned version, not auto-updated"
  end

  keg_only :versioned_formula

  def install
    bin.install "godot-4.7-stable-nouid-Linux" => "godot-no-uids@4.7"
    chmod "+x", bin/"godot-no-uids@4.7"
  end

  test do
    system bin/"godot-no-uids@4.7", "--version"
  end
end
