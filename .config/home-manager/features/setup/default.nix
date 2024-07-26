{ pkgs, inputs,  ... }:

{
  home.file.".config/picom/picom-workaround.conf".source = ../../dotfiles/picom.conf;
  services.picom.enable = true;
}
