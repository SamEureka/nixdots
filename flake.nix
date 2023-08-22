{
  description = "Sam's NixOS config for raider and precision";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/release-23.05";
    utils.url = "github:gytis-ivaskevicius/flake-utils-plus";
    hyprland.url = "github:hyprwm/Hyprland";
    waybar-hyprland.url = "github:hyprwm/hyprland";
    xdg-portal-hyprland.url = "github:hyprwm/xdg-desktop-portal-hyprland";
    nur.url = "github:nix-community/NUR";
    nix-colors.url = "github:misterio77/nix-colors";
    ryan-mono.url = "github:ryanccn/ryan-mono";

    # SFMono w/ patches
    sf-mono-liga-src = {
      url = "github:shaunsingh/SFMono-Nerd-Font-Ligaturized";
      flake = false;
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    hyprland,
    home-manager,
    utils,
    ...
  } @ inputs: {
    nixosConfigurations = {
      raider =
        nixpkgs.lib.nixosSystem
        {
          system = "x86_64-linux";
          specialArgs = {
            inherit
              inputs
              hyprland
              ;
          };
          modules = [
            ./hosts/raider/configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useUserPackages = true;
                useGlobalPkgs = false;
                extraSpecialArgs = {inherit inputs;};
                users.sam = ./home/raider/home.nix;
              };
            }
            hyprland.nixosModules.default
            {programs.hyprland.enable = true;}
          ];
        };
      precision = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
          inherit inputs hyprland;
        };
        modules = [
          ./hosts/precision/configuration.nix
          # home-manager.nixosModules.home-manager
          # {
          #   home-manager = {
          #     useUserPackages = true;
          #     useGlobalPkgs = false;
          #     extraSpecialArgs = {inherit inputs;};
          #     users.redyf = ./home/laptop/laptop.nix;
          #   };
          # }
          hyprland.nixosModules.default
          {programs.hyprland.enable = true;}
        ];
      };
    };
    # homeConfigurations = {
    #   "redyf@laptop" = home-manager.lib.homeManagerConfiguration {
    #     pkgs = nixpkgs.legacyPackages.x86_64-linux;
    #     extraSpecialArgs = {inherit inputs;};
    #     modules = [./home/laptop/laptop.nix];
    #   };
    # };
  };
}
