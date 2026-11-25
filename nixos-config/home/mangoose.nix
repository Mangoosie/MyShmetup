{ pkgs, config, ... }:
{
  imports = [
    ./neovim.nix
    ./git.nix
    ./ssh.nix
    ./kitty.nix
  ];

  home.packages = [
	(pkgs.writeShellScriptBin "nixrebuild" ''
	set -euo pipefail
	case "''${1:-desktop}" in
		desktop) host="desktop-nixos" ;;
		*)       host="$1" ;;
		esac
		action="''${2:-switch}"

		exec nixos-rebuild "$action" \
		--flake "${config.home.homeDirectory}/Documents/git/MyShmetup/nixos-config#''${host}" --use-remote-sudo
    '')
  ];
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  home.stateVersion = "26.11";
}
