FROM nixos/nix:latest

COPY config.nix /root/.config/nixpkgs/config.nix
COPY nix-files /env-setup
WORKDIR /env-setup

RUN nix-env -if base.nix
RUN nix-env -if network-recon.nix

WORKDIR /usr/share/wordlists
RUN curl https://gitlab.com/kalilinux/packages/wordlists/-/raw/kali/master/rockyou.txt.gz?inline=false -o rockyou.txt.gz && gzip -d rockyou.txt.gz
RUN git clone https://github.com/danielmiessler/SecLists.git

RUN mkdir /antigen && ln -s $(find / -type f -name antigen.zsh -exec ls {} \; 2>/dev/null) /antigen/antigen.zsh

COPY .zshrc /root/.zshrc
RUN zsh -c 'source /root/.zshrc'

WORKDIR /data

CMD ["zsh"]