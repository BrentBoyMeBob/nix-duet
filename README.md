# Quick Notice
As of now, I am no longer using ChromeOS or Crostini. The Duet is now running [Cadmium Linux](https://github.com/maccraft123/cadmium), which runs Debian as it's main distro (which is unfortunate, because I don't like Debian all that much). Soon, I will be creating a new dotfiles repository for the Duet running a Cadmium Sway setup (was using Phosh, ran it pretty well) managed by GNU Stow.

Some of the code in this repository is poorly written or "ol-mate fixed", but it's still functional for getting a Nix Crostini setup off the ground. I intend to leave this repository up for people to learn Nix on their Chromebook, so feel free to take a look at the scripts and learn from it and make your own Nix-Chrome hybrid setup. Maybe even fix up this current repository, the sky is the limit!

# Crostini Nix Dotfiles
Hey there! You are currently looking at the dotfiles for my Nix Crostini configuration that I use on my Chromebook Duet. It involves some novelties, including a Vim config. Note that the code might be relatively messy, as I'm relatively new to Nix and I'm mainly designing this for myself in mind. This is only recommended with a new Crostini setup in mind.

# How to Install
1. Clone the dotfiles with `git clone https://github.com/BrentBoyMeBob/nix-duet`.
2. Most importantly, ABSOLUTELY make sure to modify my `.config/nixpkgs/home.nix` to match what you want to include and also certain required variables.
3. Make sure you are in the Git repository directory by now with `cd nix-duet`, otherwise the script may not work.
4. Run `./initialize1.sh` to install most of the stuff.
5. Jackpot. Feel free to remove the repository directory from your system by now, as all of it is stored onto your system.
