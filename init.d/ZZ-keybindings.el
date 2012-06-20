;;; ZZ to load this after everything else so nothing gets trompted.
(setq ns-command-modifier (quote meta)) ; Command is meta in OS X
(setq mac-option-modifier 'super) ; option is 's' when looking at keybindings

;; shorten some function calls
(defalias 'eb 'erase-buffer)
(defalias 'list-buffers 'ibuffer) ;; overrides defaults
(defalias 'yes-or-no-p 'y-or-n-p)
(defalias 'rr 'replace-regexp)
(defalias 'rb 'rename-buffer)

(global-set-key [f5]   'shell)
(global-set-key [f6]   'rgrep)
(global-set-key [f7]   'eb)
(global-set-key [f8]   'bookmark-set)
(global-set-key [f9]   'boomark-jump)

(global-set-key [(meta backspace)] 'backward-kill-word)
(global-set-key (kbd "C-x C-o")    'delete-blank-lines)
(global-set-key (kbd "C-c C-i")    'ido-insert-buffer)
(global-set-key (kbd "C-c C-d")    'duplicate-line)
(global-set-key (kbd "C-M-f")      'ns-toggle-fullscreen)
(global-set-key (kbd "C-c f")      'find-file-at-point)
(global-set-key (kbd "C-c C-n")    'linum-mode)

(global-set-key (kbd "s-b") 'bury-buffer)
(global-set-key (kbd "s-r") 'replace-regexp)

(global-set-key (kbd "S-SPC") 'char-to-space)
(global-set-key [(shift return)] 'insert-empty-line)
(global-set-key [(meta return)] 'newline-and-indent)

(global-set-key "\C-ci" 'ido-goto-symbol) ;; ido for imenu (complete on function names in active buffer)
(global-set-key "\C-cs" 'ido-shell-buffer) ;; switch between open shells
(global-set-key "\C-cd" 'ido-dired-buffer) ;; switch between open direds
(global-set-key "\C-cm" 'ido-mode-buffer) ;; switch between open direds

;; Jump to a definition in the current file. (This is awesome.)
(global-set-key (kbd "C-x C-i") 'ido-imenu)

;; Resize windows
(global-set-key (kbd "S-C-<left>")  'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>")  'shrink-window)
(global-set-key (kbd "S-C-<up>")    'enlarge-window)

;; auto-complete goodness
(global-set-key (kbd "M-/") 'hippie-expand)
(custom-set-variables
 '(hippie-expand-try-functions-list
   '(try-complete-file-name-partially
     try-complete-file-name
     try-expand-all-abbrevs
     try-expand-dabbrev
     try-expand-dabbrev-all-buffers
     try-expand-dabbrev-from-kill
     try-complete-lisp-symbol-partially
     try-complete-lisp-symbol)))

;; Use regex searches by default.
(global-set-key (kbd "C-s")   'isearch-forward-regexp)
(global-set-key (kbd "C-r")   'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)

(windmove-default-keybindings) ;; Shift+direction

;; Help should search more than just commands
(global-set-key (kbd "C-h a") 'apropos)


;; Org related
(global-set-key (kbd "C-S-r") 'org-capture)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(define-key global-map "\C-cc" 'org-capture)
(define-key global-map "\C-cr" 'org-capture)
(global-set-key "\C-co" 'org-iswitchb)

;; The wonder and magic that is git
(global-set-key (kbd "M-g m") 'magit-status)


(global-set-key (kbd "C-c S-e")      'erc-start-or-switch) ;; ERC
