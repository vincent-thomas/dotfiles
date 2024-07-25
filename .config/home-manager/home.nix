{ config, pkgs, inputs, lib, ... }:

{

  home.stateVersion = "23.11";

  home.username = "vincent";
  home.homeDirectory = "/home/vincent";

  programs.home-manager.enable = true;

  imports = [
    ./features/firefox.nix
  ];

  programs.eza = {
    enable = true;
    icons = true;
  };

  # DEV SETUP
  programs.neovim.enable = true;
  programs.zellij.enable = true;
  programs.starship.enable = true;
  programs.zoxide.enable = true;

  programs.git = {
    enable = true;
    userName = "Vincent Thomas";
    userEmail = "77443389+vincent-thomas@users.noreply.github.com";
    aliases = {
      st = "status";
    };
    extraConfig = {
      init = {
        defaultBranch = "main";
      };
    };
  };

  # GENERAL
  home.packages = with pkgs; [
    htop
    ripgrep
    stow
    fzf
    ranger
  ];

  # DOTFILES
  home.file = {};

  # Firefox

  programs.firefox = {
    enable = true;
    profiles.vincent = {
      extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
        ublock-origin
        sponsorblock
        darkreader
      ];
    };
  };
}
