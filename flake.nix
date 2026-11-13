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
        nix-config.homeModules.profiles.base
        {
          my.programs = {
            brave.enable = true;
            git.enable = true;
            terminator.enable = true;
            tmux.enable = true;
            vim.enable = true;
            zsh.enable = true;
          };
        }
        ./home.nix
      ];
    };
  };
}
