(setq magit-git-executable "/usr/local/bin/git")
(setq epg-gpg-program "/usr/local/bin/gpg")

;; Add stuff I need to my shell load path
(setenv "PATH" (concat "/usr/local/bin:/usr/local/git/bin/git:" (getenv "PATH")))
(setq exec-path (append exec-path '("/usr/local/bin" )))
