class GodotNoUidsAT441 < Formula
  desc "Godot Engine with UID generation disabled by default (pinned to 4.4.1)"
  homepage "https://github.com/rafaismyname/godot-no-uids"
  url "https://github.com/rafaismyname/godot-no-uids/releases/download/4.4.1-stable-nouid/godot-4.4.1-stable-nouid-Linux"
  sha256 "33afd3fdac3aa2f06f8c2268a2ed5f6badcd2d75cd104e2a3a7735e92520b7e7"
  license "MIT"

  livecheck do
    skip "Pinned version, not auto-updated"
  end

  keg_only :versioned_formula

  def install
    bin.install "godot-4.4.1-stable-nouid-Linux" => "godot-no-uids@4.4.1"
    chmod "+x", bin/"godot-no-uids@4.4.1"
  end

  test do
    system bin/"godot-no-uids@4.4.1", "--version"
  end
end
