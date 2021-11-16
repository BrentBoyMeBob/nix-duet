#!/bin/sh -e
# Final script for the Nix Duet dotfiles.

# Unmount certain partitions on zsh startup to make sure Nix doesn't have a fuss.
echo 'sudo umount /proc/{cpuinfo,diskstats,meminfo,stat,uptime} > /dev/null 2>&1 || true' >> ~/.zshrc

# Finished!
echo "The dots have been installed! Enjoy your new Crostini setup!"
