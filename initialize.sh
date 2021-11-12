#!/bin/sh -e
# Nix dotfiles for Crostini (Debian); recommended for use on a freshly installed Crostini setup. Developed by BrentBoyMeBob.

# Checking if the script is being run in the dotfiles folder.
if ! [ -f "README.md" ] && [ -d ".config" ]; then
	echo "It looks like the script isn't run in the repository directory. Please set your current directory to the repository, and then run the script again."
	exit
fi

# Install the Nix package manager, first by unmounting some stuff.
sudo umount /proc/{cpuinfo,diskstats,meminfo,stat,uptime}
curl -L https://nixos.org/nix/install | sh
. ~/.nix-profile/etc/profile.d/nix.sh

# Install home-manager for Nix afterwards.
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
export NIX_PATH=$HOME/.nix-defexpr/channels${NIX_PATH:+:}$NIX_PATH
nix-shell '<home-manager>' -A install

# Copy my home-manager configuration over, and reload home-manager.
rm ~/.config/nixpkgs
cp -r .config/nixpkgs ~/.config/nixpkgs
home-manager switch

# Finished!
echo "The dots have been installed! Enjoy your new Crostini setup!"
