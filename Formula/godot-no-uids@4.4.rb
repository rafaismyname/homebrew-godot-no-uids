class GodotNoUidsAT44 < Formula
  desc "Godot Engine with UID generation disabled by default (pinned to 4.4)"
  homepage "https://github.com/rafaismyname/godot-no-uids"
  url "https://github.com/rafaismyname/godot-no-uids/releases/download/4.4-stable-nouid/godot-4.4-stable-nouid-Linux"
  sha256 "e526a38dc80c087478e0733e8cd75a37fc032e9c22a10223c93abdf629c90d33"
  license "MIT"

  livecheck do
    skip "Pinned version, not auto-updated"
  end

  keg_only :versioned_formula

  def install
    bin.install "godot-4.4-stable-nouid-Linux" => "godot-no-uids@4.4"
    chmod "+x", bin/"godot-no-uids@4.4"
  end

  test do
    system bin/"godot-no-uids@4.4", "--version"
  end
end
