This repo contains my configuration for my Nixos and Neovim, to setup my development environment(and other things :D)

## Dir structure
```
nixos-config/
├── flake.nix
├── hosts/desktop-nixos/ <-- dir for each unique host
│   ├── default.nix
│   └── hardware-configuration.nix 
├── modules/ <-- Different modules, to seperate and create a better overview of programs 
│   ├── audio.nix  
│   ├── desktop.nix   
│   ├── locale.nix      
│   ├── nix-ld.nix  
│   ├── packages.nix  
│   ├── users.nix
│   ├── boot.nix   
│   ├── hardware.nix  
│   ├── networking.nix  
│   ├── npm.nix     
│   ├── programs.nix      
│   └── ... (system modules)
└── home/ <-- programs here if they need more than a one line
    ├── mangoose.nix
    ├── neovim.nix
    ├── git.nix
    ├── ssh.nix
    └── kitty.nix
```

# nvimconfig
## Installation:
Create a symlink from .config/nvim -> git/nvimconfig/nvim
 - ln -s ~/git/nvimconfig/nvim/ -T nvim

## Dependencies on Linux:
 - Install treesitter-cli
    > Install cargo(rust)
    > libclang-dev
    > cargo install -locked tree-sitter-cli
 - Install Unzip
 - Install jsregexp
    > Install lua
    > Install lua rocks
    > install jsregexp
        >`luarocks install jsregexp`
 - Install rg
    > sudo apt-get install ripgrep
 - Install fd
    > sudo apt install fd-find



# NIXOS
## Rebuild
sudo nixos-rebuild switch --flake ~/Documents/git/MyShmetup/nixos-config#desktop-nixos


#### TODO
add kde plasma config
