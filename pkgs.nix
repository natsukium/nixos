{ config, lib, pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
    # System Core
    networkmanager xorg.xbacklight acpi

    # Core
    rxvt_unicode fish vim tmux git wget curl xsel chromium gcc
    xorg.xmodmap fzf nox

    # Network
    openssh

    # Python
    python3 python36Packages.pip

    # Editor & Text
    atom asciidoctor pandoc

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
