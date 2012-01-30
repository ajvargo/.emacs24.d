(setq magit-git-executable "/usr/local/bin/git")
(setq epg-gpg-program "/usr/local/bin/gpg")

;; Add stuff I need to my shell load path
(when (equal system-type 'darwin)
  (setenv "PATH" (concat "/usr/local/bin:/usr/local/git/bin/git:" (getenv "PATH"))))
