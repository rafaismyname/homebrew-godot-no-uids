class GodotNoUidsAT462 < Formula
  desc "Godot Engine with UID generation disabled by default (pinned to 4.6.2)"
  homepage "https://github.com/rafaismyname/godot-no-uids"
  url "https://github.com/rafaismyname/godot-no-uids/releases/download/4.6.2-stable-nouid/godot-4.6.2-stable-nouid-Linux"
  sha256 "23f9a51ee25c0855371cdeb2fa322064e8776db569079d9030e2c339468675d7"
  license "MIT"

  livecheck do
    skip "Pinned version, not auto-updated"
  end

  keg_only :versioned_formula

  def install
    bin.install "godot-4.6.2-stable-nouid-Linux" => "godot-no-uids@4.6.2"
    chmod "+x", bin/"godot-no-uids@4.6.2"
  end

  test do
    system bin/"godot-no-uids@4.6.2", "--version"
  end
end
