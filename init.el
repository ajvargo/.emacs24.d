;;; Emacs 24
;;  Heavily cribbed from http://avdi.org/devblog/category/emacs-reboot/  
;;  and 
;;  http://www.viget.com/extend/emacs-24-rails-development-environment-from-scratch-to-productive-in-5-minu/
;;

;;; Plan
;; Load packages
;; require packages
;; load my configs
;; load my themes
;; load my defuns, tweaks
;; load my keybindings
;; load machine specific tweaks

(require 'cl) ; fancy common lisp extensions

(setq ajv-emacs-init-file
      (or load-file-name buffer-file-name))
(setq ajv-emacs-config-dir
      (file-name-directory ajv-emacs-init-file))
(setq user-emacs-directory 
      ajv-emacs-config-dir)
(setq ajv-init-dir
      (expand-file-name "init.d" ajv-emacs-config-dir))
(setq ajv-emacs-temp-dir
      "~/.emacs_temp/")
(setq ajv-emacs-backup-dir
      (concat ajv-emacs-temp-dir "backup"))
(setq ajv-emacs-autosave-dir
      (concat ajv-emacs-temp-dir "autosave"))
(setq ajv-emacs-modules-dir
      (expand-file-name "modules" ajv-emacs-config-dir))
(setq ajv-emacs-saveplace-file
      (concat  ajv-emacs-config-dir "saveplace"))
(setq ajv-packages-dir
      (expand-file-name "el-get-packages" ajv-emacs-config-dir))
;; Load all elisp files in ./init.d
(if (file-exists-p ajv-init-dir)
    (dolist (file (directory-files ajv-init-dir t "\\.el$"))
      (load file)))

;; puts customization in their own file
(setq custom-file (concat ajv-emacs-config-dir "/custom.el"))
(load custom-file 'noerror) ;; don't choke if its empty


