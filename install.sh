#!/bin/sh -e
# Nix dotfiles for Crostini (Debian); recommended for use on a freshly installed Crostini setup. Developed by BrentBoyMeBob.

# Checking if the script is being run in the dotfiles folder.
if ! [ -f "README.md" ] && [ -d ".config" ]; then
	echo "It looks like the script isn't run in the repository directory. Please set your current directory to the repository, and then run the script again."
	exit
fi

# Install the Nix package manager, first by unmounting some stuff.
if ! curl -L https://nixos.org/nix/install | sh; then
	sudo umount /proc/{cpuinfo,diskstats,meminfo,stat,uptime} || true
	curl -L https://nixos.org/nix/install | sh
fi
. ~/.nix-profile/etc/profile.d/nix.sh

# Install home-manager for Nix afterwards.
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
rm -rf ~/.config/nixpkgs
export NIX_PATH=$HOME/.nix-defexpr/channels${NIX_PATH:+:}$NIX_PATH
cp -r .config/nixpkgs ~/.config/nixpkgs
nix-shell '<home-manager>' -A install

# Set up desktop icons.
mkdir -p ~/.config/systemd/user/cros-garcon.service.d/
cat > ~/.config/systemd/user/cros-garcon.service.d/override.conf <<EOF
[Service]
Environment="PATH=%h/.nix-profile/bin:/usr/local/sbin:/usr/local/bin:/usr/local/games:/usr/sbin:/usr/bin:/usr/games:/sbin:/bin"
Environment="XDG_DATA_DIRS=%h/.nix-profile/share:%h/.local/share:/usr/local/share:/usr/share"
EOF

# Unmount certain partitions on zsh startup to make sure Nix doesn't have a fuss.
echo 'PATH=$PATH:~/.nix-profile/bin/ && sudo umount /proc/{cpuinfo,diskstats,meminfo,stat,uptime} > /dev/null 2>&1 || true' >> ~/.bashrc

# Finished!
echo "The dots have been installed! Enjoy your new Crostini setup!"
