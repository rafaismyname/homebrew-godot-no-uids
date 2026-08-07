class GodotNoUidsAT452 < Formula
  desc "Godot Engine with UID generation disabled by default (pinned to 4.5.2)"
  homepage "https://github.com/rafaismyname/godot-no-uids"
  url "https://github.com/rafaismyname/godot-no-uids/releases/download/4.5.2-stable-nouid/godot-4.5.2-stable-nouid-Linux"
  sha256 "6a5762e4ea2202ca095f98351d1878abd6f4c181a37731d5fd77873c01d61628"
  license "MIT"

  livecheck do
    skip "Pinned version, not auto-updated"
  end

  keg_only :versioned_formula

  def install
    bin.install "godot-4.5.2-stable-nouid-Linux" => "godot-no-uids@4.5.2"
    chmod "+x", bin/"godot-no-uids@4.5.2"
  end

  test do
    system bin/"godot-no-uids@4.5.2", "--version"
  end
end
