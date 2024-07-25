{ pkgs, inputs, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;

    shellAliases = {
      v = "nvim";
      hms = "rm /home/vincent/.mozilla/firefox/vincent/search.json.mozlz4 && home-manager switch --flake ~/dotfiles/.config/home-manager";
    };
    initExtraFirst = ". /home/vincent/.nix-profile/etc/profile.d/nix.sh";
  };
}
