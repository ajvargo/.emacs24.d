;; Emacs 24
(require 'cl) ; fancy common lisp extensions

;; set directories I'll be needing
(setq ajv-dotfiles-dir (file-name-directory (or (buffer-file-name) load-file-name)))

;; puts customization in their own file
(setq custom-file (concat ajv-dotfiles-dir "/custom.el"))
(load custom-file 'noerror) ;; don't choke if its empty

