class GodotNoUidsAT46 < Formula
  desc "Godot Engine with UID generation disabled by default (pinned to 4.6)"
  homepage "https://github.com/rafaismyname/godot-no-uids"
  url "https://github.com/rafaismyname/godot-no-uids/releases/download/4.6-stable-nouid/godot-4.6-stable-nouid-Linux"
  sha256 "8d20dd2b185b96b6691298a489283adbb7fd7d084df42ae06add47aeec4688be"
  license "MIT"

  livecheck do
    skip "Pinned version, not auto-updated"
  end

  keg_only :versioned_formula

  def install
    bin.install "godot-4.6-stable-nouid-Linux" => "godot-no-uids@4.6"
    chmod "+x", bin/"godot-no-uids@4.6"
  end

  test do
    system bin/"godot-no-uids@4.6", "--version"
  end
end
