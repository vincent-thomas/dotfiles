{ config, pkgs, inputs, lib, builtins, ... }:

{

  home.stateVersion = "23.11";

  home.username = "vincent";
  home.homeDirectory = "/home/vincent";

  programs.home-manager.enable = true;

  imports = [
    ./features/firefox/firefox.nix
    ./features/dev/dev.nix
    ./features/misc.nix
  ];
}
