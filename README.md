# Super Smash Flash 2 — Ruffle for Lutris

A Lutris installer for **Super Smash Flash 2 Beta 1.4.0.1** that replaces the bundled legacy Adobe Flash Player runtime with a portable **Ruffle** runtime.

The goal is to provide a self-contained Linux installation without requiring Ruffle or Adobe Flash Player to be installed system-wide.

## Features

* Installs Super Smash Flash 2 Beta 1.4.0.1 directly from the official SSF2 CDN.
* Downloads a pinned Ruffle Linux x86_64 build.
* Runs the game through Ruffle instead of the bundled Adobe Flash Player.
* Removes the obsolete `fp`, `fp64`, `run.sh`, and native `SSF2` launcher after installation.
* Keeps Ruffle inside the game's installation directory.
* Supports selecting the Ruffle graphics backend during installation:

  * Automatic
  * Vulkan
  * OpenGL
* Enables Ruffle's high-performance GPU preference.
* Enables Linux GameMode when available.
* Does not require a system-wide Ruffle installation.

## Requirements

* Linux x86_64
* Lutris 0.5.x or newer
* A working Vulkan or OpenGL graphics stack
* Super Smash Flash 2 Beta 1.4.0.1-compatible Ruffle support

## Installation

Import `installer.yaml` into Lutris and follow the installation prompts.

During installation, select the desired Ruffle graphics backend:

| Backend   | Description                        |
| --------- | ---------------------------------- |
| Automatic | Allow Ruffle to choose the backend |
| Vulkan    | Force Vulkan                       |
| OpenGL    | Force OpenGL                       |

Automatic is recommended unless you specifically need Vulkan or OpenGL.

## Runtime Layout

After installation, the game is reduced to the components required by the Ruffle-based launcher:

```text
Super Smash Flash 2/
├── data/
│   ├── data/
│   └── run
├── ruffle
└── launch.sh
```

`data/run` is the compressed Flash movie used by Super Smash Flash 2.

The original Adobe Flash Player binaries are not used by this installer.

## Why Ruffle?

Adobe Flash Player reached end-of-life and is no longer maintained. Ruffle provides a modern, actively developed Flash runtime implemented in Rust.

Super Smash Flash 2 uses ActionScript 3, so compatibility is not guaranteed. Ruffle's compatibility with the game continues to improve, and some game-specific issues may still exist.

This project does not modify the SSF2 game itself. It only changes the runtime used to execute the game's Flash content.

## Repository Structure

```text
lutris-ssf2-ruffle/
├── installer.yaml
├── launch.sh
├── README.md
└── LICENSE
```

## Updating Ruffle

The Ruffle build is intentionally pinned in `installer.yaml`.

To update it:

1. Select a tested Ruffle release or nightly.
2. Update the Ruffle download URL.
3. Update the filename.
4. Update the version displayed by the Lutris installer.
5. Test SSF2 before committing the change.

## Disclaimer

This project is not affiliated with or endorsed by McLeodGaming, Super Smash Flash, Adobe, or the Ruffle project.

Super Smash Flash 2 and its associated game assets remain the property of their respective owners.

The installer downloads the game archive from the SSF2 distribution server and Ruffle from its upstream release repository. No game assets are redistributed by this repository.

## License

The installer and launcher code in this repository are released under the MIT License.

Ruffle and Super Smash Flash 2 are separate projects and are governed by their respective licenses and terms.
