{ config, pkgs, ... }:

{
  home.packages = [
    # All of these in particular are mainly just novelty packages.
    pkgs.pfetch
    pkgs.pipes
    pkgs.asciiquarium
    pkgs.fortune
    pkgs.cbonsai
    pkgs.cmatrix

    # Zsh had to be installed as an ordinary package, because home-manager has priority issues otherwise.
    pkgs.zsh
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # In particular, make complete sure that you have changed this to match your username and home directory. Will not work otherwise.
  home.username = "brent";
  home.homeDirectory = "/home/brent";

  # State the Home Manager version. 
  home.stateVersion = "21.11";
}
