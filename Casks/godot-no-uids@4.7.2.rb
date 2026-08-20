cask "godot-no-uids@4.7.2" do
  version "4.7.2"
  sha256 "580737017ea026c735392fb8f109a54d2b07a2f0c83a0b230dced6ed5c6b437f"

  url "https://github.com/rafaismyname/godot-no-uids/releases/download/#{version}-stable-nouid/godot.macos.editor.zip"
  name "Godot Engine (No UID)"
  desc "Game engine with UID generation disabled by default (pinned to 4.7.2)"
  homepage "https://github.com/rafaismyname/godot-no-uids"

  livecheck do
    skip "Pinned version, not auto-updated"
  end

  depends_on macos: :big_sur

  app "Godot.app", target: "Godot-No-UID-4.7.2.app"
  binary "#{appdir}/Godot-No-UID-4.7.2.app/Contents/MacOS/Godot", target: "godot-no-uids@4.7.2"

  postflight do
    system_command "/usr/bin/xattr", args: ["-cr", "#{appdir}/Godot-No-UID-4.7.2.app"]
  end

  zap trash: [
    "~/Library/Application Support/Godot",
    "~/Library/Caches/Godot",
    "~/Library/Saved Application State/org.godotengine.godot.savedState",
  ]
end
