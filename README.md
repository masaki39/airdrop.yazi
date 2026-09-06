# airdrop.yazi

A [Yazi](https://github.com/sxyazi/yazi) plugin to send the selected (or, if nothing is selected, the hovered) file via AirDrop on macOS, using [airdrop-cli](https://github.com/vldmrkl/airdrop-cli).

## Requirements

- macOS
- [airdrop-cli](https://github.com/vldmrkl/airdrop-cli) — provides the `airdrop` command:

  ```sh
  brew install vldmrkl/formulae/airdrop-cli
  ```

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
