{ pkgs, inputs, ... }:
{
  # GENERAL
  home.packages = with pkgs; [
    htop
    nix-output-monitor
  ];
}
