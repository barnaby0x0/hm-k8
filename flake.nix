{
  inputs = {
    nix-config.url = "github:barnaby0x0/nix-config/develop";
    home-manager.follows = "nix-config/home-manager";
  };

  outputs = { nix-config, home-manager, ... }: {
    homeConfigurations."user@k8" = home-manager.lib.homeManagerConfiguration {
      pkgs = nix-config.lib.commons.mkPkgs "x86_64-linux";
      extraSpecialArgs = {
        self = nix-config;
      };

      modules = [
        nix-config.homeModules.profiles.base
        nix-config.homeModules.profiles.niri
        {
          my.programs = {
            brave.enable = true;
            git.enable = true;
            terminator.enable = true;
            tmux.enable = true;
            vim.enable = true;
            zsh.enable = true;
          };

          programs.noctalia = {
            enable = true;

            settings = {
              theme.mode = "dark";
              bar.default = {
                position = "bottom";
                auto_hide = false;
                margin_ends = 0; # pleine largeur
                margin_edge = 0; # collée au bord
                radius = 0; # coins carrés
              };

              wallpaper = {
                directory = "/home/user/.wallpapers";
                automation = {
                  enabled = false;
                  interval_seconds = 1800;
                  order = "random";
                  pause_on_fullscreen = false;
                  recursive = true;
                };
              };
            };
          };
        }
        ./home.nix
      ];
    };
  };
}
