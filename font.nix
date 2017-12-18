{ config, lib, pkgs, ...}:

{
  fonts = {
    fonts = with pkgs; [
      noto-fonts
      source-code-pro
      source-sans-pro
      source-serif-pro
      emojione
      powerline-fonts
    ];

    fontconfig = {
      defaultFonts = {
        monospace = [
          "source-code-pro"
          "DejaVu Sans Mono for Powerline"
        ];
        serif = [ 
          "source-serif-pro"
          "Noto Serif CJK JP"
        ];
        sansSerif = [
          "source-sans-pro"
          "Noto Sans CJK JP"
        ];
      };
    };
  };
}
