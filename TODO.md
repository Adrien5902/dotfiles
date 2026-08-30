# Switch to nixos todos
- [X] Minimal setup config
- [X] Multi host config

# Apps
## Gaming
- [X] steam
- [X] heroic
- [ ] sober
- [ ] pandora launcher
- [ ] minecraft nix servers

## Other
- [ ] hyprland (although i plan on keeping lua there's still things to configure)
- [X] wallpapers
- [ ] nvim (lazy -> nix)
- [X] spotify with spicetify
- [ ] waybar
- [X] starship
- [ ] rofi
- [ ] kitty/ghosty
- [X] fish
- [X] git
- [X] gh
- [X] keyd
- [X] grim slurp
- [ ] thunar
- [ ] gtk theme
- [ ] adb
- [ ] qs notif daemon

## XDG
- [ ] hyprland DP
- [ ] hyprland preview share picker
- [ ] phosh DP
- [X] cursor

## My apps
- [ ] uhu
- [ ] kdeconnect waybar
- [ ] mutex

## Zen
- [X] enable
### Customization
### Extensions
- [X] uBlock
- [ ] vimium
- [ ] 2FA
- [X] dark reader
- [X] zen internet
- [ ] proton vpn
- [ ] steam db

# Dev
- [ ] opam
- [ ] rust
- [ ] lua
- [ ] js/ts bun biome

# Notes

## vimium config
### custom css
div > .vimiumHintMarker {
  padding: 2px 3px;
  background-color: #abffd7;
  border: 0;
  border-radius: 2px;
  background-image: none;
}

div > .vimiumHintMarker span {
  font-size: 11px;
  font-weight: bold;
  text-shadow: none;
  color: #4a400e;
}

div > .vimiumHintMarker > .matchingCharacter {
  color: #dcbc2a;
}

### keyMappings
map ! visitPreviousTab

#### Unmaps
unmap /
unmap f
unmap F
unmap t

map s LinkHints.activateMode
map S LinkHints.activateModeToOpenInNewTab

#### Tabs
unmap J
unmap K

map J nextTab
map K previousTab
