{ pkgs, ... }:
{
  home.username = "user";
  home.homeDirectory = "/home/user";
  home.stateVersion = "26.05";

  my.user.git = {
    name = "Victor";
    email = "victor@mail.net";
  };

  programs.alacritty = {
    enable = true;
    theme = "solarized_dark";
  };

  home.packages =  with pkgs; [
    cowsay
    home-manager
    meld
  ];
}
