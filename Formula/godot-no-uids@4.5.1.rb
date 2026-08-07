class GodotNoUidsAT451 < Formula
  desc "Godot Engine with UID generation disabled by default (pinned to 4.5.1)"
  homepage "https://github.com/rafaismyname/godot-no-uids"
  url "https://github.com/rafaismyname/godot-no-uids/releases/download/4.5.1-stable-nouid/godot-4.5.1-stable-nouid-Linux"
  sha256 "31d03136570eddf0baf5fc9d2845b706764b8729506c67e3504e69d0a47d32f2"
  license "MIT"

  livecheck do
    skip "Pinned version, not auto-updated"
  end

  keg_only :versioned_formula

  def install
    bin.install "godot-4.5.1-stable-nouid-Linux" => "godot-no-uids@4.5.1"
    chmod "+x", bin/"godot-no-uids@4.5.1"
  end

  test do
    system bin/"godot-no-uids@4.5.1", "--version"
  end
end
