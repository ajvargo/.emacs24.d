;;; Emacs 24
;;  Heavily cribbed from http://avdi.org/devblog/category/emacs-reboot/
;;  and
;;  http://www.viget.com/extend/emacs-24-rails-development-environment-from-scratch-to-productive-in-5-minu/
;;

(require 'cl) ; fancy common lisp extensions

(setq  ajv-emacs-init-file      (or load-file-name buffer-file-name)
       ajv-emacs-config-dir     (file-name-directory ajv-emacs-init-file)
       user-emacs-directory     ajv-emacs-config-dir
       ajv-init-dir             (expand-file-name "init.d" ajv-emacs-config-dir)
       ajv-emacs-temp-dir       "~/.emacs_temp/"
       ajv-emacs-backup-dir     (concat ajv-emacs-temp-dir "backup")
       ajv-emacs-autosave-dir   (concat ajv-emacs-temp-dir "autosave")
       ajv-emacs-modules-dir    (expand-file-name "modules" ajv-emacs-config-dir)
       ajv-emacs-saveplace-file (concat  ajv-emacs-config-dir "saveplace")
       ajv-emacs-bookmarks-file (concat  ajv-emacs-config-dir "bookmarks")
       ajv-packages-dir         (expand-file-name "el-get-packages" ajv-emacs-config-dir))

;; Load all elisp files in ./init.d
(if (file-exists-p ajv-init-dir)
    (dolist (file (directory-files ajv-init-dir t "\\.el$"))
      (load file)))

;; load  based on my machine & user name
;; vargo.el or vargo/*.el...
(setq system-specific-config (concat ajv-emacs-config-dir system-name ".el")
      user-specific-config (concat ajv-emacs-config-dir user-login-name ".el")
      user-specific-dir (concat ajv-emacs-config-dir user-login-name))
(add-to-list 'load-path user-specific-dir)

(if (file-exists-p system-specific-config) (load system-specific-config))
(if (file-exists-p user-specific-config) (load user-specific-config))
(if (file-exists-p user-specific-dir)
   (mapc #'load (directory-files user-specific-dir nil ".*el$")))


;; puts customization in their own file
(setq custom-file (concat ajv-emacs-config-dir "custom.el"))
(load custom-file 'noerror) ;; don't choke if its empty
