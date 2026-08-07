cask "godot-no-uids@4.7.1" do
  version "4.7.1"
  sha256 "8a6664dc00fab9da570c52d3310cc7d5688ba6a263a6baf9e1c7b2c6964b8878"

  url "https://github.com/rafaismyname/godot-no-uids/releases/download/#{version}-stable-nouid/godot.macos.editor.zip"
  name "Godot Engine (No UID)"
  desc "Game engine with UID generation disabled by default (pinned to 4.7.1)"
  homepage "https://github.com/rafaismyname/godot-no-uids"

  livecheck do
    skip "Pinned version, not auto-updated"
  end

  depends_on macos: :big_sur

  app "Godot.app", target: "Godot-No-UID-4.7.1.app"
  binary "#{appdir}/Godot-No-UID-4.7.1.app/Contents/MacOS/Godot", target: "godot-no-uids@4.7.1"

  postflight do
    system_command "/usr/bin/xattr", args: ["-cr", "#{appdir}/Godot-No-UID-4.7.1.app"]
  end

  zap trash: [
    "~/Library/Application Support/Godot",
    "~/Library/Caches/Godot",
    "~/Library/Saved Application State/org.godotengine.godot.savedState",
  ]
end
