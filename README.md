# More Farms (FS25)

A Farming Simulator 25 mod that raises the multiplayer farm limit from 8 to **30 farms** in one session.

## Features

- Up to 30 farms per multiplayer session (the base game allows 8).
- Each farm gets its own icon. The mod adds a set of 32 farm icons (barn, tractor, cow, bee, windmill and more) in `gui.dds`.
- A palette of 32 farm colors. The Create/Edit Farm dialog offers the first 8.
- New farms get the first free farm ID, so IDs left by deleted farms are reused.
- Multiplayer: made for multiplayer. Farms can only be created on the server. In singleplayer the farm limit is not changed.
- Translations: English, German, French, Dutch (mod title and description).

## Installation

1. Download `FS25_moreFarms.zip`.
2. Copy the zip, without unpacking it, to your mods folder:
   - Windows: `Documents\My Games\FarmingSimulator2025\mods`
   - Linux (Proton/Steam): `<steam prefix>/drive_c/users/steamuser/Documents/My Games/FarmingSimulator2025/mods`
3. Enable the mod when you load or create a savegame. In multiplayer, the server and every player need the mod.

## Repository layout

```
FS25_moreFarms/
├── modDesc.xml          # Mod metadata, title, description, source files
├── icon_moreFarms.dds   # Mod icon
├── moreFarms.lua        # Farm limit, farm IDs, colors and icons
├── gui.xml              # Icon slices in gui.dds
└── gui.dds              # Farm icons
.github/workflows/       # Builds and releases the zip on push
build.sh                 # Builds the zip
FS25_moreFarms.zip       # Packaged mod, ready to install
*.psd, *.png             # Source art for the icons and ModHub image
```

## Building the zip

Run the build script from the repo root:

```sh
./build.sh
```

It finds the folder that contains `modDesc.xml` and zips its **contents** into `FS25_moreFarms.zip`, so `modDesc.xml` sits at the root of the archive. It skips junk files like `.DS_Store` and `Thumbs.db`. The script finds the mod folder by itself, so you can copy `build.sh` into another mod repo without changing it.

### Automatic builds

Every push to `main` runs [`.github/workflows/build.yml`](.github/workflows/build.yml) on GitHub. It runs `build.sh` and publishes the zip as a GitHub Release, tagged with the `<version>` from `modDesc.xml` (for example `v1.0.0.0`):

- **New version:** a new release is created.
- **Same version:** the zip on the existing release is replaced.

To publish a new release, bump `<version>` in `modDesc.xml` and push.

## Adding a translation

This mod has no `l10n` folder. The only text is the title and description in `modDesc.xml`.

1. Add a `<lang>` entry (for example `<es>`) under `<title>` in `modDesc.xml`.
2. Add the same `<lang>` entry under `<description>`.

## Changelog

- **1.0.0.0**: First release.

## Author

MechNoxer
