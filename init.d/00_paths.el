(setq epg-gpg-program "/usr/local/bin/gpg")

;; Add stuff I need to my shell load path
(setenv "PATH" (concat "/usr/local/bin:/usr/local/git/bin/git:/usr/local/git:/usr/local/git/bin:" (getenv "PATH")))
(setenv "GIT_EDITOR" "/usr/local/Cellar/emacs/HEAD/bin/emacsclient")
(setenv "ALTERNATE_EDITOR" "/usr/local/Cellar/emacs/HEAD/bin/emacsclient")
(setq exec-path (append exec-path '("/usr/local/bin" )))
