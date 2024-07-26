{ pkgs, inputs, ... }:
{
  # GENERAL
  home.packages = with pkgs; [
    htop
    nix-output-monitor
    fastfetch
  ];

  programs.btop = {
    enable = true;
    settings = {
      color_theme = "onedark";
      theme_background = false;
    };
  };
}
