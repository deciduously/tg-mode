;; -*- lexical-binding: t; -*-
;;; tg-mode/config.el

(require 'typescript-mode)

(define-derived-mode tg-mode typescript-mode "tg"
  "Major mode for editing .tg files"
  (setq-local lsp-command '("tg" "lsp")))

(add-to-list 'auto-mode-alist '("\\.tg\\'" . tg-mode))

(provide 'tg-mode)
