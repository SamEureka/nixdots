<h1 align="center">
<a href='#'><img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/palette/macchiato.png" width="600px"/></a>
  <br>
  <br>
  <div>
    <a href="https://github.com/sameureka/nixdots/issues">
        <img src="https://img.shields.io/github/issues/sameureka/nixdots?color=fab387&labelColor=303446&style=for-the-badge">
    </a>
    <a href="https://github.com/sameureka/nixdots/stargazers">
        <img src="https://img.shields.io/github/stars/sameureka/nixdots?color=ca9ee6&labelColor=303446&style=for-the-badge">
    </a>
    <a href="https://github.com/sameureka/nixdots/">
        <img src="https://img.shields.io/github/repo-size/sameureka/nixdots?color=ea999c&labelColor=303446&style=for-the-badge">
    </a>
    <a href="https://github.com/sameureka/nixdots/blob/master/LICENSE">
        <img src="https://img.shields.io/static/v1.svg?style=for-the-badge&label=License&message=MIT&logoColor=ca9ee6&colorA=313244&colorB=cba6f7"/>
    </a>
    <br>
    </div>
   </h1>
   <br>

<div align="center">
<h1>
❄️ NixOS periodi ❄️
</h1>
</div>
<h2 align="center">NixOS system configuration. Feel free to explore!</h2>

## Special thanks to:

- [Redyf](https://github.com/Redyf/nixdots)
- [NixOS Manual](https://nixos.org/manual/nixos/stable/)
- [ZerotoNix](https://zero-to-nix.com)
- [notusknot](https://github.com/notusknot)
- [Catppuccin](https://github.com/catppuccin)
- [linuxmobile](https://github.com/linuxmobile)
- [Sioodmy's dotfiles](https://github.com/sioodmy/dotfiles)
- [Siduck76's NvChad](https://github.com/siduck76/nvchad/)
- [NotAShelf's dotfiles](https://github.com/NotAShelf/nyx)
- [AlphaTechnolog's dotfiles](https://github.com/AlphaTechnolog/nixdots)

<div align="center">
<img align="right" src="./assets/rice.png" alt="Rice Preview" width="400px" height="253"/>
<img align="right" src="./assets/nvim.png" alt"Rice Preview2" width="400px" height="253"/>
  <a href="https://github.com/sameureka/SamVim">Neovim</a>
</div>

```mint
⠀⠀   🌸 Setup / Hyprland 🌸
 -----------------------------------

 ╭─ Distro  -> NixOS
 ├─ Editor  -> Neovim
 ├─ Browser -> Firefox / Chrome
 ├─ Shell   -> ZSH
 ╰─ Resource Monitor -> Btop

 ╭─ Model -> DELL Precision 3560
 ├─ CPU   -> Intel i5-1145G7 (8) @ 4.4GHz
 ├─ GPU   -> Intel TigerLake-LP GT2 (Iris Xe)
 ╰─ Resolution -> 1920x1080@59hz

 ╭─ WM       -> Hyprland
 ├─ Terminal -> Kitty
 ├─ Theme    -> Catppuccin
 ├─ Icons    -> Papirus-Dark
 ├─ Font     -> JetBrains Mono Nerd Font
 ╰─ Hotel    -> Hotels.com

                        
```

## Commands you should know:

- Rebuild and switch to change the system configuration (in the configuration directory):

```
rebuild
```

OR

```
sudo nixos-rebuild switch --flake '.#<config-name>'
```

- Connect to internet (Change what's inside the brackets with your info).

```
iwctl --passphrase [passphrase] station [device] connect [SSID]
```

## Installation

> IMPORTANT: Do not use my configuration.nix and/or hardware-configuration.nix! These files include specific settings to my drives and are unlikely to have a positive reaction on your device!

It might not work perfectly right after installation, you have been warned!

For best security, make sure the files will not conflict with your current ones.

Pré-requisitos:

- [NixOS installed and running](https://nixos.org/manual/nixos/stable/index.html#ch-installation)
- [Flakes enabled](https://nixos.wiki/wiki/flakes)
- Root access

Clono the repo and cd into it:

```bash
git clone https://github.com/sameureka/nixdots ~/flake && cd ~/flake
```

Create a hardware configuration for your system:

```bash
sudo nixos-generate-config
```

You can add or create your own output in flake.nix through the following template:

```nix
nixosConfigurations = {
    # Now, creating a new system config can be done with a single line.
    #                                Architecture   Hostname
    raider = nixpkgs.lib.nixosSystem "x86_64-linux" "raider";
    precision = nixpkgs.lib.nixosSystem "x86_64-linux" "precision";
    # ADD YOUR COMPUTER HERE! (feel free to remove mine)
    yourComputer = nixpkgs.lib.nixosSystem "x86_64-linux" "yourComputer";
};
```

Finally, rebuild your configuration with:

```bash
sudo nixos-rebuild switch --flake .#yourComputer
```

And that's all!

## Conclusion

This code is licensed under the MIT license, so you can use or distribute the code however you like.
