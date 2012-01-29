;; These should run in Ruby mode
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))

(defun set-reindent-then-newline-and-indent ()
  (interactive)
  (local-set-key (kbd "RET") 'reindent-then-newline-and-indent))

(add-hook 'ruby-mode-hook 'set-reindent-then-newline-and-indent)

(setq ruby-insert-encoding-magic-comment nil)
