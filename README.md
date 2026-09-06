# airdrop.yazi

A [Yazi](https://github.com/sxyazi/yazi) plugin to send the selected (or, if nothing is selected, the hovered) file via AirDrop on macOS.

It reveals the target file(s) in Finder and then triggers Finder's built-in "Share via AirDrop" shortcut (`Cmd+Shift+R`).

## Requirements

- macOS (uses Finder and System Events via AppleScript)

> The plugin sends the Finder shortcut `Cmd+Shift+R` through System Events. macOS may require you to grant Accessibility permission to your terminal (e.g. Ghostty) under **System Settings > Privacy & Security > Accessibility**.

> Known limitation: if the selected files span multiple directories, Finder may open several windows and the AirDrop share will not behave as intended.

## Installation

```sh
ya pkg add masaki39/airdrop
```

## Update

```sh
ya pkg upgrade masaki39/airdrop
```

## Configuration

Add a keybinding in `~/.config/yazi/keymap.toml`:

```toml
[[mgr.prepend_keymap]]
on = ["g", "a"]
run = "plugin airdrop"
desc = "Open AirDrop"
```

## License

MIT
