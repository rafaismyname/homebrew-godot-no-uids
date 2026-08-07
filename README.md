# Homebrew Tap for Godot (No UID)

Install the custom ["No UIDs"](https://github.com/rafaismyname/godot-no-uids) build of Godot via Homebrew, on macOS or Linux. Every version ever published on the [releases page](https://github.com/rafaismyname/godot-no-uids/releases) stays installable, pinned to its own version.

## macOS (Cask)

Install the latest version:

```bash
brew tap rafaismyname/godot-no-uids
brew install --cask godot-no-uids
```

Install a specific version instead — this installs side by side with any other version, as `Godot-No-UID-<version>.app` with its own `godot-no-uids@<version>` binary:

```bash
brew install --cask godot-no-uids@4.6.2
```

Update to the latest:

```bash
brew upgrade godot-no-uids
```

**Gatekeeper note:** these builds aren't Apple-notarized. The cask automatically clears the quarantine flag on install, so the app opens normally — no manual `xattr` step needed.

## Linux (Formula)

```bash
brew tap rafaismyname/godot-no-uids
brew install godot-no-uids
```

Or a specific version:

```bash
brew install godot-no-uids@4.6.2
```

## Windows

Homebrew doesn't run on Windows. Grab the `.exe` directly from the [releases page](https://github.com/rafaismyname/godot-no-uids/releases).

## Available versions

Every version on the [releases page](https://github.com/rafaismyname/godot-no-uids/releases) has a matching pinned cask/formula (`godot-no-uids@<version>`). Browse [`Casks/`](Casks) or [`Formula/`](Formula) for the full list, or run:

```bash
brew search rafaismyname/godot-no-uids/godot-no-uids
```

## How this tap stays up to date

A [workflow](https://github.com/rafaismyname/godot-no-uids/blob/master/.github/workflows/update_homebrew_tap.yml) in the main `godot-no-uids` repo pushes a new pinned cask/formula here — and updates the "latest" ones — automatically whenever a new release is published. See [`scripts/generate.rb`](scripts/generate.rb) for how the files are generated.
