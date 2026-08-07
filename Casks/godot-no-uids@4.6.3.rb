cask "godot-no-uids@4.6.3" do
  version "4.6.3"
  sha256 "e02e956efe46830603c39b7520be083f84c574e0c16395d0c489dd27c28eded0"

  url "https://github.com/rafaismyname/godot-no-uids/releases/download/#{version}-stable-nouid/godot.macos.editor.zip"
  name "Godot Engine (No UID)"
  desc "Game engine with UID generation disabled by default (pinned to 4.6.3)"
  homepage "https://github.com/rafaismyname/godot-no-uids"

  livecheck do
    skip "Pinned version, not auto-updated"
  end

  depends_on macos: :big_sur

  app "Godot.app", target: "Godot-No-UID-4.6.3.app"
  binary "#{appdir}/Godot-No-UID-4.6.3.app/Contents/MacOS/Godot", target: "godot-no-uids@4.6.3"

  postflight do
    system_command "/usr/bin/xattr", args: ["-cr", "#{appdir}/Godot-No-UID-4.6.3.app"]
  end

  zap trash: [
    "~/Library/Application Support/Godot",
    "~/Library/Caches/Godot",
    "~/Library/Saved Application State/org.godotengine.godot.savedState",
  ]
end
