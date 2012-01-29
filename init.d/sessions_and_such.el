;; ----------------------------------------------------------------------
;; Backing up, you know its hard to do...
(make-directory ajv-emacs-backup-dir t)
(make-directory ajv-emacs-autosave-dir t)

(setq backup-directory-alist  `(("." . ,ajv-emacs-backup-dir)))
(setq auto-save-file-name-transforms `(("." ,ajv-emacs-autosave-dir t)))


(defun auto-save-file-name-p (filename)
  (string-match "^#.*#$" (file-name-nondirectory filename)))

(defun make-auto-save-file-name ()
  (concat ajv-emacs-autosave-dir
          (if buffer-file-name
              (concat "#" (file-name-nondirectory buffer-file-name) "#")
            (expand-file-name
             (concat "#%" (buffer-name) "#")))))

;;------------------------------------------------------------------------
;; Saving my desktop between sessions
;; save a list of open files in ~/.emacs.desktop
;; save the desktop file automatically if it already exists
(setq desktop-save 'if-exists)
(desktop-save-mode 1)

;; save a bunch of variables to the desktop file
;; for lists specify the len of the maximal saved data also
(setq desktop-globals-to-save
      (append '((extended-command-history . 30)
                (file-name-history        . 100)
                (grep-history             . 30)
                (compile-history          . 30)
                (minibuffer-history       . 50)
                (query-replace-history    . 60)
                (read-expression-history  . 60)
                (regexp-history           . 60)
                (regexp-search-ring       . 20)
                (search-ring              . 20)
                (shell-command-history    . 50)
                (eshell-command-history   . 50)
                tags-file-name
                register-alist)))

(require 'saveplace) ; save where I am in the files
(setq save-place-file ajv-emacs-saveplace-file) ;; keep my ~/ clean
(setq-default save-place t)                   ;; activate it for all buffers
