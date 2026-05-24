cask "godot-no-uids" do
  version "4.6.3"
  sha256 :no_check

  url "https://github.com/rafaismyname/godot-no-uids/releases/download/#{version}-stable-nouid/godot.macos.editor.zip"
  name "Godot Engine (No UID)"
  desc "Game engine with UID generation disabled by default"
  homepage "https://github.com/rafaismyname/godot-no-uids"

  conflicts_with cask: "godot"
  
  app "Godot.app"
  binary "#{appdir}/Godot.app/Contents/MacOS/Godot", target: "godot"

  zap trash: [
    "~/Library/Application Support/Godot",
    "~/Library/Caches/Godot",
    "~/Library/Saved Application State/org.godotengine.godot.savedState",
  ]
end
