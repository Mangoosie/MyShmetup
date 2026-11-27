{ lib, osConfig, pkgs, config, ... }:
let
	repo = "${config.home.homeDirectory}/Documents/git/MyShmetup";
in {
  imports = [
    ./neovim.nix
    ./git.nix
    ./ssh.nix
	./bash.nix
    ];
  xdg.configFile."nvim".source = config.lib.file.mkOutOfStoreSymlink "${repo}/nvim";
  home.packages = [
	(pkgs.writeShellScriptBin "nixrebuild" ''
	set -euo pipefail
	        host="''${1:-$(hostname)}"
		action="''${2:-switch}"

		exec nixos-rebuild "$action" \
		--flake "${config.home.homeDirectory}/Documents/git/MyShmetup/nixos-config#''${host}" --sudo
    '')
  ];
  home.stateVersion = "26.11";
}
