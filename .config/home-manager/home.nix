{ config, pkgs, ... }:

{
  home.username = "vt";
  home.homeDirectory = "/home/vt";

  # DO NOT CHANGE
  home.stateVersion = "23.11";

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.eza = {
    enable = true;
    icons = false;
  };

  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;
    autocd = true;
    enableCompletion = true;
    shellAliases = {
      ls = "eza -al";
      v = "nvim";
      c = "z";
    };
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.git = {
    enable = true;
    userName = "Vincent Thomas";
    userEmail = "77443389+vincent-thomas@users.noreply.github.com";

    extraConfig = {
      init = {
        defaultBranch = "main";
      };
      url = {
        "ssh://git@github.com/" = {
          insteadOf = ["https://github.com/"];
        };
      };
    };
  };

  programs.neovim = {
    enable = true;
  #  extraLuaConfig = builtins.readFile "${config.home.homeDirectory}/.config/home-manager/nvim/init.lua";
#    extraConfig = builtins.readFile("${config.home.homeDirectory}/.config/home-manager/nvim/init.vim") ;
  };

  programs.zellij = {
    enable = true;
  };

  home.packages = with pkgs; [
    htop
    # Required by telescope
    ripgrep
    bacon
    rustup
    nodejs_20
    stow
    unzip
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. jjjIf you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/vt/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "nvim";
    v = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
