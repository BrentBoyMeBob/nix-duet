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
  ];

  # Configure Vim..
  programs.vim = {
    # Enable it first.
    enable = true;

    # Add some plugins.
    plugins = with pkgs.vimPlugins; [ 
      lightline-vim
      nord-vim
      nerdtree
      rainbow
    ];

    # Configure it through Vim script.
    extraConfig = ''
      " Disable mouse input because it messes with the Crostini terminal.
      set mouse=

      " Enable the Nord theme along with the lightline theme.
      colorscheme nord
      let g:lightline = {
        \ 'colorscheme': 'nord',
        \ }

      " Disable case sensitivity.
      set ignorecase

      " Enable Rainbow brackets.
      let g:rainbow_active = 1
    '';
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # In particular, make complete sure that you have changed this to match your username and home directory. Will not work otherwise.
  home.username = "brent";
  home.homeDirectory = "/home/brent";

  # State the Home Manager version. 
  home.stateVersion = "21.11";
}
