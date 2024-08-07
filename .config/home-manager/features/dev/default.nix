{ pkgs, inputs, ... }:
{
  imports = [
    ./shell.nix
    ./yazi
  ];

  programs.eza = {
    enable = true;
    icons = true;
    enableZshIntegration = true;
    git = true;
  };

  programs.zellij.enable = true;
  programs.zoxide.enable = true;
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

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
  ];

  programs.kitty = {
    enable = true;
    theme = "One Dark";
    font = {
      name = "Jetbrains Mono Nerd Font";
      size = 12;
    };
  };
}
