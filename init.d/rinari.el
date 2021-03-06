(defun ajv-add-rinari-keys ()
;  (local-set-key (kbd "C-c c") 'rinari-find-controller)
  (local-set-key (kbd "C-c h") 'rinari-find-helper)
  (local-set-key (kbd "C-c j") 'rinari-find-javascript)
  (local-set-key (kbd "C-c r") 'rinari-find-rspec)
  (local-set-key (kbd "C-c m") 'rinari-find-model)
  (local-set-key (kbd "C-c p") 'rinari-goto-partial)
  (local-set-key (kbd "C-c x") 'rinari-extract-partial)
  )

(add-hook 'rinari-minor-mode-hook 'ajv-add-rinari-keys)
(setq rinari-tags-file-name "TAGS")
