# tg-mode

Emacs major mode for editing [Tangram](https://tangram.dev) typescript with LSP support.

## Usage

This package requires `lsp-mode`, `typescript-mode`, and `projectile`, as well as the `tg` binary available in your `$PATH`.

I use DOOM Emacs. Here is an example module. Under `~/.doom.d/modules/lang/tangram-typescript`, add these files:

`packages.el`:

```elisp
;; -*- no-byte-compile: t; -*-
;;; lang/tangram-typescript/packages.el
;;; Not sure we actually install any packages with this module?

;;; We derive the major mode for .tg files from typescript-mode.
(package! projectile)
(package! lsp-mode)
(package! typescript-mode)

(package! tg-mode
 :recipe (:host github :repo "deciduously/tg-mode"))
```

`config.el`:

```elisp
;;; lang/tangram-typescript/config.el

(after! projectile
  (add-to-list 'projectile-project-root-files "tangram.tg"))

(use-package! tg-mode
 :config
 (add-hook 'tg-mode-hook 'tg-mode-setup))
```

`doctor.el`:

```elisp
(unless (executable-find "tg")
  (warn! "Couldn't find tg binary"))
```

Then, in `~/.doom.d/init.el`, just add `:lang tangram-typescript` to your `(doom! ...)` form and be sure to run `doom sync`.

## Status

Working:

- Typechecking
- Formatting
- Go to def
- Find references
- Renaming

Todo:

- [ ] Configure server path
- [ ] Configure tracing
- [ ] Non-`projectile` project detection.
