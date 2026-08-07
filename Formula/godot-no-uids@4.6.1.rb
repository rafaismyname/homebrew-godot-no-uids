class GodotNoUidsAT461 < Formula
  desc "Godot Engine with UID generation disabled by default (pinned to 4.6.1)"
  homepage "https://github.com/rafaismyname/godot-no-uids"
  url "https://github.com/rafaismyname/godot-no-uids/releases/download/4.6.1-stable-nouid/godot-4.6.1-stable-nouid-Linux"
  sha256 "dae5b8c79ac852ea5b44e1d741d48f7a0a320b0d6e34854df1ab822ec196eb82"
  license "MIT"

  livecheck do
    skip "Pinned version, not auto-updated"
  end

  keg_only :versioned_formula

  def install
    bin.install "godot-4.6.1-stable-nouid-Linux" => "godot-no-uids@4.6.1"
    chmod "+x", bin/"godot-no-uids@4.6.1"
  end

  test do
    system bin/"godot-no-uids@4.6.1", "--version"
  end
end
