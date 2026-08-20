class GodotNoUids < Formula
  desc "Godot Engine with UID generation disabled by default"
  homepage "https://github.com/rafaismyname/godot-no-uids"
  url "https://github.com/rafaismyname/godot-no-uids/releases/download/4.7.1-stable-nouid/godot-4.7.1-stable-nouid-Linux"
  sha256 "68b7217801fb8f811379a3f6b9fdd1375de6664b1ea180ad8ea0054adcf9286e"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  def install
    bin.install "godot-4.7.1-stable-nouid-Linux" => "godot-no-uids"
    chmod "+x", bin/"godot-no-uids"
  end

  test do
    system bin/"godot-no-uids", "--version"
  end
end
