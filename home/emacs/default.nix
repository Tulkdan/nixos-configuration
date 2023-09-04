{
  pkgs,
  ...
}: {
  programs.emacs = {
    enable = true;

    package = pkgs.emacs29;

    extraConfig = ''
      (setq vc-follow-symlinks t)

      (org-babel-load-file "~/.emacs.d/emacs.org")
    '';
  };

  home.file.".emacs.d/emacs.org".source = ./emacs.org;
}
