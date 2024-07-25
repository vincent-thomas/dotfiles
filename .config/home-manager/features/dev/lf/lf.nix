{ pkgs, inputs, ... }:
{
  xdg.configFile."lf/icons".source = ./icons;
  programs.lf = {
    enable = true;
    commands = {
      dragon-out = ''%${pkgs.xdragon}/bin/xdragon -a -x "$fx"'';
      editor-open = ''$$EDITOR $f'';
      mkdir = ''
      ''${{
        printf "Dirname: "
        read DIR
        mkdir $DIR
      }}
      '';
    };

    keybindings = {
      "\\\"" = "";
      o = "";
      c = "mkdir";
      "." = "set hidden!";
      "<enter>" = "open";
      do = "dragon-out";
      "g~" = "cd";
      gh = "cd";
      ee = "editor-open";
    };
    settings = {
      preview = true;
      hidden = true;
      drawbox = true;
      icons = true;
      ignorecase = true;
    };
  };
}
