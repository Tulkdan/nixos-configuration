{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;

    package = pkgs.vscodium;

    extensions = with pkgs.vscode-extensions; [
      catppuccin.catppuccin-vsc
      editorconfig.editorconfig
      eamodio.gitlens
      esbenp.prettier-vscode
      dbaeumer.vscode-eslint
      vscodevim.vim
    ];

    userSettings = {
      "window.menuBarVisibility" = "toggle";
      "workbench.colorTheme" = "Catppuccin Mocha";
      "workbench.iconTheme" = "catppuccin-mocha";
      "editor.minimap.enabled" = false;
      "editor.fontFamily" = "'Hasklig','Droid Sans Mono', 'monospace', monospace";
      "editor.fontLigatures" = true;
      "editor.renderWhitespace" = "trailing";
      "editor.cursorStyle" = "underline";
      "editor.lineNumbers" = "relative";
    };
  };
}
