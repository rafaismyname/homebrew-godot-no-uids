cask "godot-no-uids@4.6.1" do
  version "4.6.1"
  sha256 "1e0ccb5eb509a11f6d999fd18faeaadb7da83dc4890482fcc73d136adf35d8e3"

  url "https://github.com/rafaismyname/godot-no-uids/releases/download/#{version}-stable-nouid/godot.macos.editor.zip"
  name "Godot Engine (No UID)"
  desc "Game engine with UID generation disabled by default (pinned to 4.6.1)"
  homepage "https://github.com/rafaismyname/godot-no-uids"

  livecheck do
    skip "Pinned version, not auto-updated"
  end

  depends_on macos: :big_sur

  app "Godot.app", target: "Godot-No-UID-4.6.1.app"
  binary "#{appdir}/Godot-No-UID-4.6.1.app/Contents/MacOS/Godot", target: "godot-no-uids@4.6.1"

  postflight do
    system_command "/usr/bin/xattr", args: ["-cr", "#{appdir}/Godot-No-UID-4.6.1.app"]
  end

  zap trash: [
    "~/Library/Application Support/Godot",
    "~/Library/Caches/Godot",
    "~/Library/Saved Application State/org.godotengine.godot.savedState",
  ]
end
