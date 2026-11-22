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

  programs.alacritty = {
    enable = true;
    theme = "solarized_dark";
  };

  my.programs = {
    brave.enable = true;
    firefox.enable = true;
    git.enable = true;
    terminator.enable = true;
    vim.enable = true;
    zsh.enable = true;
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
  ];
}
