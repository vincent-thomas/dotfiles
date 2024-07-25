{ config, pkgs, inputs, lib, builtins, ... }:

{

  home.stateVersion = "23.11";

  home.username = "vincent";
  home.homeDirectory = "/home/vincent";

  programs.home-manager.enable = true;

  imports = [
    # inputs.nix-colors.homeManagerModules.default
    ./features/firefox/firefox.nix
    ./features/dev/dev.nix
    ./features/misc.nix
  ];

  # colorScheme = inputs.nix-colors.colorSchemes.onedark;
}
