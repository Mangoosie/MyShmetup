{ lib, config, ... }:
{
	imports = [
	../../modules/locale.nix
	../../modules/users.nix
	../../modules/packages.nix
	../../modules/nix-ld.nix
	../../modules/npm.nix
	];
	wsl.enable = true;
	wsl.defaultUser ="mangoose";


	networking.hostName = "kkwsl-nixos";
	system.stateVersion = "26.11";
	nixpkgs.config.allowUnfree = true;

	nix.settings.experimental-features = [ "nix-command" "flakes" ];

	home-manager.useGlobalPkgs = true;
	home-manager.useUserPackages = true;
	
	home-manager.users.mangoose = { config, ... }: {
		imports = [ ../../home/mangoose.nix ];
		home.file.devops.source = config.lib.file.mkOutOfStoreSymlink "/mnt/c/Users/K956/Documents/npm/git-devops/";
  };
}
