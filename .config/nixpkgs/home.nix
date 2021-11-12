{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.pfetch
  ];
  
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # In particular, make complete sure that you have changed this to match your username and home directory. Will not work otherwise.
  home.username = "brent";
  home.homeDirectory = "/home/brent";

  # State the Home Manager version. 
  home.stateVersion = "21.11";
}
