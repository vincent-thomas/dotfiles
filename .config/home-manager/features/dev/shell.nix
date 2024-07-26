{ pkgs, inputs, ... }:
{

  home.file.".config/starship.toml".source = ../../dotfiles/starship.toml;

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    oh-my-zsh = {
      enable = true;
      plugins = [
        "direnv"
      ];
    };

    shellAliases = {
      v = "nvim";
      hms = "rm -f /home/vincent/.mozilla/firefox/vincent/search.json.mozlz4 && home-manager switch --flake ~/dotfiles/.config/home-manager";
      sudo = "doas";
    };
    initExtraFirst = builtins.readFile ../../dotfiles/.zshrc;
  };
}
