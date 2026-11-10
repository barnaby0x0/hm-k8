{
  inputs = {
    nix-config.url = "github:barnaby0x0/nix-config/develop";
    nixpkgs.follows = "nix-config/nixpkgs";
    home-manager.follows = "nix-config/home-manager";
  };

  outputs = { nix-config, nixpkgs, home-manager, ... }: {
    homeConfigurations."user@k8" = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.x86_64-linux;

      modules = [
        nix-config.homeModules.args
        nix-config.homeModules.profiles.base
        nix-config.homeModules.profiles.desktop
        nix-config.homeModules.profiles.development
        {
          my.programs = {
            brave.enable = true;
            firefox.enable = true;
          };
        }
        ./home.nix
      ];
    };
  };
}
