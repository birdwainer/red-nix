#! /bin/sh

sed -e "s/nixos-unstable-/nixos-unstable-$(date +%F)/" -e "s/rev = /rev = \"$(git ls-remote https://github.com/NixOS/nixpkgs.git refs/heads/nixpkgs-unstable \
| cut -f 1)\";/" templates/network-recon.template > nix-files/network-recon.nix

xhost + local:docker

docker build -t nix-for-hacking .

docker run -it --env "DISPLAY=$DISPLAY" --cap-add=NET_ADMIN --device /dev/net/tun \
-v "$HOME/.Xauthority:/root/Xauthority:rw" -v /tmp/.X11-unix:/tmp/.X11-unix \
-v "$HOME/github/thm:/data" nix-for-hacking
