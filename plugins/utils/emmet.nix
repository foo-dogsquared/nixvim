{
  lib,
  pkgs,
  ...
} @ attrs:
with lib; let
  helpers = import ../helpers.nix {inherit lib;};
in
  with helpers.vim-plugin;
    mkVimPlugin attrs {
      name = "emmet";
      package = pkgs.vimPlugins.emmet-vim;
      globalPrefix = "user_emmet_";

      options = {
        mode = mkDefaultOpt {
          type = types.enum ["i" "n" "v" "a"];
          global = "mode";
          description = "Mode where emmet will enable";
        };

        leader = mkDefaultOpt {
          type = types.str;
          global = "leader_key";
          description = "Set leader key";
        };

        settings = mkDefaultOpt {
          type = with types; attrsOf anything;
          global = "settings";
          description = "Emmet settings";
        };
      };
    }
