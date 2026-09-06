# airdrop.yazi

A [Yazi](https://github.com/sxyazi/yazi) plugin to send the selected (or, if nothing is selected, the hovered) file via AirDrop on macOS, using [airdrop-cli](https://github.com/vldmrkl/airdrop-cli).

## Requirements

- macOS
- [airdrop-cli](https://github.com/masaki39/airdrop-cli) — provides the `airdrop` command:

  ```sh
  brew tap masaki39/tap
  brew install masaki39/tap/airdrop-cli
  ```

  This installs [masaki39/airdrop-cli](https://github.com/masaki39/airdrop-cli), a fork of
  [vldmrkl/airdrop-cli](https://github.com/vldmrkl/airdrop-cli). The upstream published stable
  formula is broken (the AirDrop panel never opens), and even on the working `main` the
  `airdrop` process lingers forever if the share panel is dismissed without completing a
  share. The fork fixes both.

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
