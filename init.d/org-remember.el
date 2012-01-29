(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(setq org-log-done t
      org-directory "~/org"
;      org-startup-folded "overview" ;"showeverything"
      org-archive-location (concat org-directory "/archives/%s_archive::")
      org-mobile-directory "~/Dropbox/MobileOrg"
      org-mobile-inbox-for-pull "~/org/mobile.org"
      org-hide-leading-stars nil
      org-completion-use-ido t
      org-return-follows-link t
      org-log-done 'time
      org-todo-keyword-faces '(("TODO" . (:foreground "red" :weight bold))
                               ("UNREAD" . (:foreground "red" :weight bold))
                               ("NEXT" . (:foreground "forest green" : weight bold))
                               ("STARTED" . (:foreground "blue" :weight bold))
                               ("WAITING" . (:foreground "yellow" :weight bold))
                               ("CANCELLED" . (:foreground "orange" :weight bold)))
      org-todo-keywords '((sequence "TODO(t)" "NEXT(n)"  "STARTED(i)" "WAITING(w)" "|" "DONE(d)")
                               (sequence "|" "CANCELLED(c)"))
      org-agenda-files (list (concat org-directory "/home.org")
                             (concat org-directory "/work.org")
                             (concat org-directory "/projects.org")
                             (concat org-directory "/books.org"))
      org-agenda-start-on-weekday nil ; or day of week, 0 based
      org-agenda-ndays 7 ; default 7
      org-agenda-skip-scheduled-if-done t
      org-refile-use-outline-path nil ;t file
      org-outline-path-complete-in-steps t  ; tab moves completion to next level
      org-refile-allow-creating-parent-nodes "confirm"
      org-refile-targets '(("home.org" :level . 1)
                           ("work.org" :level . 2)
                           ("books.org" :level . 1)
                           ("projects.org" :maxlevel . 3))
      org-default-notes-file (concat org-directory "/notes.org")
      org-capture-templates '(
                              ("t" "Generic Todo" entry (file+headline "" "Incoming") "** TODO %?\n  %i" :kill-buffer)
                              ("h" "Home Todo" entry (file+headline "home.org" "Incoming") "** TODO %?\n  %i" :kill-buffer)
                              ("w" "Work Todo" entry (file+headline "work.org" "Incoming") "** TODO %?\n  %i" :kill-buffer)
                              ("p" "Project Todo" entry (file+headline "projects.org" "Incoming") "** TODO %?\n  %i" :kill-buffer)
                              ("b" "Book!" entry (file "books.org") "* TODO %? %^g" :immediate-finish)
                              )
      org-tags-column 100
      org-mobile-force-id-on-agenda-items nil
      org-link-abbrev-alist '(("google" . "http://www.google.com/search?q=")
                              ("gmap". "http://maps.google.com/maps?q=%s")))

(set-register ?h '(file . "~/org/home.org"))
;;org-tag-alist
  ;;  Which tags should be available? Note that tags besides the configured ones can be used, but for the important ones you can define keys for fast access here.
;;org-tags-column
  ;;  How should tags be aligned in the headline?
;;org-fast-tag-selection-single-key
  ;;  Set this to make the tags interface even faster, if all you normally do is changing a single tag.
  ;;  What should be on the menu when you refile tasks with C-c C-w?


;; ;; Set to the name of the file where new notes will be stored
;; (setq org-mobile-inbox-for-pull "~/Dropbox/org/inbox.org")
;; ;; Set to <your Dropbox root directory>/MobileOrg.
;; (setq org-mobile-directory "~/Dropbox/MobileOrg")
;; (setq org-mobile-files (quote ("~/Dropbox/org")))

