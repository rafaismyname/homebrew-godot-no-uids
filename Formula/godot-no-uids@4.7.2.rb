class GodotNoUidsAT472 < Formula
  desc "Godot Engine with UID generation disabled by default (pinned to 4.7.2)"
  homepage "https://github.com/rafaismyname/godot-no-uids"
  url "https://github.com/rafaismyname/godot-no-uids/releases/download/4.7.2-stable-nouid/godot-4.7.2-stable-nouid-Linux"
  sha256 "3737f64f754fa60af3c8527ffef6f084529837fb2c84d0c61fb53f9b59dd01bc"
  license "MIT"

  livecheck do
    skip "Pinned version, not auto-updated"
  end

  keg_only :versioned_formula

  def install
    bin.install "godot-4.7.2-stable-nouid-Linux" => "godot-no-uids@4.7.2"
    chmod "+x", bin/"godot-no-uids@4.7.2"
  end

  test do
    system bin/"godot-no-uids@4.7.2", "--version"
  end
end
