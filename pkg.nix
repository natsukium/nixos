{ config, lib, pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
    # Core
    rxvt_unicode fish vim tmux git wget curl xsel chromium networkmanager gcc
    xorg.xmodmap fzf nox

    # Network
    openssh

    # Python
    python3 python36Packages.pip

    # Editor
    atom asciidoctor

    # Xmonad
    haskellPackages.xmonad
    haskellPackages.xmobar
    haskellPackages.xmonad-contrib
    haskellPackages.xmonad-extras

    # Others
    ranger w3m lynx screenfetch

    # For NVDIA GPU
    bumblebee
  ];
}
