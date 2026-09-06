# airdrop.yazi

A [Yazi](https://github.com/sxyazi/yazi) plugin to open the macOS AirDrop sharing window from within Yazi.

## Requirements

- macOS (uses Finder and System Events via AppleScript)

> The plugin sends the Finder shortcut `Cmd+Shift+R` through System Events. macOS may require you to grant Accessibility permission to your terminal (e.g. Ghostty) under **System Settings > Privacy & Security > Accessibility**.

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
