{ pkgs, ... }:
{
  home.username = "user";
  home.homeDirectory = "/home/user";
  home.stateVersion = "26.05";

  imports = [
    ./user/flatpak.nix
    ./user/noctalia.nix
  ];

  my.user.git = {
    name = "Victor";
    email = "victor@mail.net";
  };

  programs = {
    alacritty = {
      enable = true;
    };
    keepassxc = {
      enable = true;
      autostart = false;
      settings = {
        FdoSecrets.Enabled = true;
        Browser.Enabled = true;
      };
    };
  };

  my.programs = {
    brave.enable = true;
    codium.enable = true;
    firefox.enable = true;
    git.enable = true;
    terminator.enable = true;
    vim.enable = true;
    zsh.enable = true;
  };

  # Override binds
  my.programs.niri.extraBinds = {
    "Mod+Shift+B".spawn = [ "brave" ];
    "Mod+Alt+T".spawn = [ "terminator" ];
  };

  # Taille du curseur (méthode qui fonctionne)
  home.pointerCursor = {
    enable = true;
    name = "Adwaita";
    package = pkgs.adwaita-icon-theme;
    size = 24;
    gtk.enable = true;
    x11.enable = true;
  };

  # Et éventuellement
  # dconf.settings."org/gnome/desktop/interface" = {
  #   cursor-theme = "Adwaita";
  #   cursor-size = 24;
  # };

  home.packages = with pkgs; [
    home-manager
    nixfmt-tree
    mpvpaper
    mpv
    socat
    ripgrep
  ];
}
