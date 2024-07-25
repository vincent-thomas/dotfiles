{ pkgs, inputs, ... }:
{

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    enableZshIntegration = true;
  };
  programs.zsh = {
    enable = true;
    enableCompletion = true;

    shellAliases = {
      v = "nvim";
      hms = "rm -f /home/vincent/.mozilla/firefox/vincent/search.json.mozlz4 && home-manager switch --flake ~/dotfiles/.config/home-manager";
    };
    initExtraFirst = ". /home/vincent/.nix-profile/etc/profile.d/nix.sh";
  };
}
