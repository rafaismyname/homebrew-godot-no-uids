cask "godot-no-uids@4.6.2" do
  version "4.6.2"
  sha256 "238771a1625ead3d44d0bb2ad71ef169406ea44f36d6791f48442764a5ff4302"

  url "https://github.com/rafaismyname/godot-no-uids/releases/download/#{version}-stable-nouid/godot.macos.editor.zip"
  name "Godot Engine (No UID)"
  desc "Game engine with UID generation disabled by default (pinned to 4.6.2)"
  homepage "https://github.com/rafaismyname/godot-no-uids"

  livecheck do
    skip "Pinned version, not auto-updated"
  end

  depends_on macos: :big_sur

  app "Godot.app", target: "Godot-No-UID-4.6.2.app"
  binary "#{appdir}/Godot-No-UID-4.6.2.app/Contents/MacOS/Godot", target: "godot-no-uids@4.6.2"

  postflight do
    system_command "/usr/bin/xattr", args: ["-cr", "#{appdir}/Godot-No-UID-4.6.2.app"]
  end

  zap trash: [
    "~/Library/Application Support/Godot",
    "~/Library/Caches/Godot",
    "~/Library/Saved Application State/org.godotengine.godot.savedState",
  ]
end
