# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./pkg.nix
      ./font.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # NVIDIA GPU
  hardware = {
    bumblebee = {
      enable = true;
      driver = "nvidia";
      group = "video";
    };
    opengl.driSupport32Bit = true;
  };

  networking = {
    hostName = "nix"; # Define your hostname.
    networkmanager.enable = true;
  };

  # Select internationalisation properties.
  i18n = {
    consoleFont = "Lat2-Terminus16";
    consoleKeyMap = "us";
    defaultLocale = "en_US.UTF-8";
    inputMethod ={
      enabled = "fcitx";
      fcitx.engines = with pkgs; [
        fcitx-engines.mozc
      ];
    };
  };

  # Set your time zone.
  time.timeZone = "Asia/Tokyo";

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.bash.enableCompletion = true;
  # programs.mtr.enable = true;
  # programs.gnupg.agent = { enable = true; enableSSHSupport = true; };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = true;

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  services.xserver = {
    enable = true;  # Enable the X11 windowing system.
    layout = "us";
    xkbOptions = "eurosign:e";
    # libinput.enable = true;  # Enable touchpad support.
    # Enable touchpad support
    synaptics = {
      enable = true;
      twoFingerScroll = true;
    };
    # Enable Xmonad
    windowManager.xmonad.enable = true;
    windowManager.default = "xmonad";
    desktopManager.xterm.enable = false;
    desktopManager.default = "none";
    displayManager.sddm.enable = true;
    videoDrivers = [ "intel" ];
  };

  nixpkgs.config.allowUnfree = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.extraUsers.miz = {
    isNormalUser = true;
    createHome = true;
    home = "/home/miz";
    extraGroups = ["wheel" "networkmanager" "audio" "video"];
    uid = 1000;
  };

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "17.09"; # Did you read the comment?

}
