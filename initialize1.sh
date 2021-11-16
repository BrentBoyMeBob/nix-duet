#!/bin/sh -e
# Nix dotfiles for Crostini (Debian); recommended for use on a freshly installed Crostini setup. Developed by BrentBoyMeBob.

# Checking if the script is being run in the dotfiles folder.
if ! [ -f "README.md" ] && [ -d ".config" ]; then
	echo "It looks like the script isn't run in the repository directory. Please set your current directory to the repository, and then run the script again."
	exit
fi

# Install the Nix package manager, first by unmounting some stuff.
sudo umount /proc/{cpuinfo,diskstats,meminfo,stat,uptime} || true
curl -L https://nixos.org/nix/install | sh
. ~/.nix-profile/etc/profile.d/nix.sh

# Install home-manager for Nix afterwards.
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
rm -rf ~/.config/nixpkgs
export NIX_PATH=$HOME/.nix-defexpr/channels${NIX_PATH:+:}$NIX_PATH
cp -r .config/nixpkgs ~/.config/nixpkgs
nix-shell '<home-manager>' -A install

# Zsh was stubborn with home-manager, so install oh-my-zsh manually.
sudo su -c "echo /home/$USER/.nix-profile/bin/zsh >> /etc/shells"
sudo chsh $USER -s /home/$USER/.nix-profile/bin/zsh
echo 'sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"' > ~/.zshrc

# Complete in the other script.
echo 'Please reload Crostini and run the next script.'