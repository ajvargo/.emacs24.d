(setq ibuffer-saved-filter-groups
      '(("work"
         ("Org" (or (mode . org-mode)
                    (filename . "OrgMode")))
         ("dired" (mode . dired-mode))
         ("Magit" (name . "\*magit"))
         ("Shell" (mode . shell-mode))
         ("Spec" (filename . ".*_spec.rb"))
         ("Model" (filename . ".*/models/.*.rb"))
         ("Help" (or (name . "\*Help\*")
                     (name . "\*Apropos\*")
                     (name . "\*info\*")))
         ("emacs-config" (or (filename . ".emacs.d")
                             (filename . "emacs-config")))
         ("ERC" (mode . erc-mode))
         )))

(add-hook 'ibuffer-mode-hook
	  '(lambda ()
	     (ibuffer-switch-to-saved-filter-groups "work")))

(setq ibuffer-show-empty-filter-groups nil)
