;; backups and autosave placement
(make-directory ajv-emacs-backup-dir t)
(make-directory ajv-emacs-autosave-dir t)

(setq backup-directory-alist  `(("." . ,ajv-emacs-backup-dir)))
(setq auto-save-file-name-transforms `(("." ,ajv-emacs-autosave-dir t)))
