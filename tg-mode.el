;;; tg-mode --- Summary
;;; tg-mode is a major mode for editing Tangram typescript.
;;; Commentary:
;;; Must install the tg binary somewhere on your $PATH.
;; -*- lexical-binding: t; -*-
;;; tg-mode/config.el
;;; Code:

(require 'lsp-mode)
(require 'typescript-mode)

(define-derived-mode tg-mode typescript-mode "Tangram Typescript"
  "Major mode for editing .tg files.")
 

(add-to-list 'auto-mode-alist '("\\.tg\\'" . tg-mode))

(with-eval-after-load 'lsp-mode
  (add-to-list 'lsp-language-id-configuration
               '(tg-mode . "Tangram Typescript"))
  (lsp-register-client
   (make-lsp-client :new-connection (lsp-stdio-connection '("tg" "lsp"))
                    :activation-fn (lsp-activate-on "Tangram Typescript")
                    :served-id 'tglsp)))

(provide 'tg-mode)

;;; tg-mode.el ends here
