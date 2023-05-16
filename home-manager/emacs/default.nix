{
  programs.emacs = {
    enable = true;

    extraConfig = ''
      (setq vc-follow-symlinks t)

      (org-babel-load-file "~/.emacs.d/emacs.org")
    '';
  };

  home.file.".emacs.d/emacs.org".source = ./emacs.org;
}
