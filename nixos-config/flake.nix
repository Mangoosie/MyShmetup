{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
	nix-alien = {
		url = "github:thiagokokada/nix-alien";
		inputs.nixpkgs.follows = "nixpkgs";
	};
  };

  outputs = { self, nixpkgs, home-manager, nix-alien, nixos-wsl, ... }@inputs: {
    nixosConfigurations.desktop-nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        ./hosts/desktop-nixos
        home-manager.nixosModules.home-manager
      ];
    };
    nixosConfigurations.kkwsl-nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [
      nixos-wsl.nixosModules.default
      {}
        ./hosts/kkwsl-nixos
        home-manager.nixosModules.home-manager
      ];
    };
  };
}
