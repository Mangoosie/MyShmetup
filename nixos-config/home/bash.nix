{ config, pkgs, ... }:
let
	repo = "${config.home.homeDirectory}/Documents/git/MyShmetup";
in {
	home.file.".dircolors".source = config.lib.file.mkOutOfStoreSymlink "${repo}/.dircolors";
	
	programs.bash = {
		enable = true;
		shellAliases = {
			ls = "ls --color=auto";
			grep = "grep --color=auto";
		};
		initExtra = ''
			eval "$(dircolors -b ~/.dircolors)"
		'';
	};
}
