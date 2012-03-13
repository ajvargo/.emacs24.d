
(setq ibuffer-saved-filter-groups
      '(("work"
         ("Org" (or (mode . org-mode)
                    (filename . "OrgMode")))
         ("dired" (mode . dired-mode))
         ("Magit" (name . "\*magit"))
         ("Model" (filename . ".*/app/models/.*\.rb"))
         ("Controller" (filename . ".*/app/controllers/.*"))
         ("View" (filename . ".*/app/views/.*"))
         ("Helper" (filename . ".*/app/helpers/.*"))
         ("Javascript" (or (filename . ".*/assets/.*.js")
                           (filename . ".*/.*.js")))
         ("Spec" (filename . ".*/spec/.*"))
         ("Other Ruby" (filename . ".*/.*\.rb$"))
         ("Shell" (mode . shell-mode))
         ("Log" (filename . ".*\.log$"))
         ("*..*" (name . "\*.*\*"))
         ("emacs config" (or (filename . ".emacs.d")
                             (filename . "emacs-config")
                             (filename . ".*/.*.el$")))
         ("ERC" (mode . erc-mode))
         )))

(add-hook 'ibuffer-mode-hook
          '(lambda ()
             (ibuffer-switch-to-saved-filter-groups "work")
             (add-to-list 'ibuffer-never-show-predicates "TAGS")))

(setq ibuffer-show-empty-filter-groups nil)
(setq ibuffer-formats '( ;; ( mark modified read-only
                         ;;        " " (mode 5 5 :left :elide)
                         ;;        " " " " (name 35 -1 :left :elide)
                         ;;        " " filename-and-process)
                         (mark modified read-only " " (name 35 -1 :left :elide))
                         (mark modified read-only " " (name 35 -1 :left :elide) " " " " filename-and-process)
                         (mark modified read-only " "
                               (name 35 -1 :left :elide)
                               " "
                               (mode 16 16 :left :elide)
                               " "
                               filename-and-process)
                         (mark modified read-only " "
                               (name 45 45 :left :elide)
                               " "
                               (size 9 -1 :right)
                               " "
                               (mode 16 16 :left :elide)
                               " " filename-and-process)))
(setq ibuffer-filter-group-name-face 'font-lock-doc-face)
