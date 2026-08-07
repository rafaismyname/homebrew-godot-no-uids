class GodotNoUidsAT463 < Formula
  desc "Godot Engine with UID generation disabled by default (pinned to 4.6.3)"
  homepage "https://github.com/rafaismyname/godot-no-uids"
  url "https://github.com/rafaismyname/godot-no-uids/releases/download/4.6.3-stable-nouid/godot-4.6.3-stable-nouid-Linux"
  sha256 "be29544dc374b56d495729153253099b4a4fee1f73eb94ed1f53d1bd16abdeb2"
  license "MIT"

  livecheck do
    skip "Pinned version, not auto-updated"
  end

  keg_only :versioned_formula

  def install
    bin.install "godot-4.6.3-stable-nouid-Linux" => "godot-no-uids@4.6.3"
    chmod "+x", bin/"godot-no-uids@4.6.3"
  end

  test do
    system bin/"godot-no-uids@4.6.3", "--version"
  end
end
