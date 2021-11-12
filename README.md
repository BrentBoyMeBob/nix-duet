# Crostini Nix Dotfiles
Hey there! You are currently looking at the dotfiles for my Nix Crostini configuration that I use on my Chromebook Duet. It involves some novelties, including an Emacs config. Note that the code might be relatively messy, as I'm relatively new to Nix and I'm mainly designing this for myself in mind. 

# How to Install
1. Clone the dotfiles with `git clone https://github.com/BrentBoyMeBob/nix-duet`.
2. Most importantly, ABSOLUTELY make sure to modify my `.config/nixpkgs/home.nix` to match what you want to include and also certain required variables.
3. Make sure you are in the Git repository directory by now with `cd nix-duet`, otherwise the script may not work.
4. Run `./initialize.sh` which will pretty much do the rest of the installation for you.
5. Jackpot. Feel free to remove the repository directory from your system by now, as all of it is stored onto your system.
