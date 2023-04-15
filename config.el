;; -*- lexical-binding: t; -*-
;;; tg-mode/config.el

(use-package! typescript-mode)

(use-package! tg-mode
  :mode ("\\.tg\\'" . tg-mode)
  :init
  (setq lsp-command '("tg" "lsp")))
