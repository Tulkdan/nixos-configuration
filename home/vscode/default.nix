{pkgs, ...}: {
  programs.vscode = {
    enable = true;

    package = pkgs.vscodium;

    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        catppuccin.catppuccin-vsc
        editorconfig.editorconfig
        eamodio.gitlens
        esbenp.prettier-vscode
        dbaeumer.vscode-eslint
        vscodevim.vim
        denoland.vscode-deno
        yoavbls.pretty-ts-errors
      ];

      userSettings = {
        "window.menuBarVisibility" = "toggle";
        "workbench.colorTheme" = "Catppuccin Mocha";
        "workbench.iconTheme" = "catppuccin-mocha";
        "editor.minimap.enabled" = false;
        "editor.fontFamily" = "'Departure Mono', 'Monaspace Krypton', 'Hasklig','Droid Sans Mono', 'monospace', monospace";
        "editor.fontLigatures" = true;
        "editor.renderWhitespace" = "trailing";
        "editor.cursorStyle" = "underline";
        "editor.lineNumbers" = "relative";
        "editor.wordWrap" = "on";
      };
    };
  };
}
