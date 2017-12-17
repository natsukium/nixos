{ config, lib, pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
    # Core
    fish vim tmux git wget curl xsel chromium networkmanager gcc nox
    xorg.xmodmap fzf

    # Network
    openssh

    # Python
    python3 pyhon36Packages.pip

    # Editor
    atom

    # Xmonad
    haskelPackages.xmonad
    haskelPackages.xmobar
    haskelPackages.xmonad-contrib
    haskelPackages.xmonad-extras

    # Others
    ranger w3m lynx screenfetch

    # For NVDIA GPU
    bumblebee
  ];
}
