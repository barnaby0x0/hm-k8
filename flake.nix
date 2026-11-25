{
  inputs = {
    nix-config.url = "github:barnaby0x0/nix-config/v0.4";
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
        nix-config.homeModules.nix-flatpak
        ./home.nix
        #{
        #  wayland.windowManager.niri.settings.binds."Mod+Shift+B".spawn = [ "brave" ];
        #}
      ];
    };
  };
}
