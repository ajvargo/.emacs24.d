;; fuzzy matching for ido
(setq ido-enable-flex-matching t)
;; very nice completey stuff
(ido-mode t)

(defun ido-for-mode(prompt the-mode)
  "General function to prompt for open buffers of a given mode with ido"
  (switch-to-buffer
   (ido-completing-read prompt
                        (save-excursion
                          (delq
                           nil
                           (mapcar (lambda (buf)
                                     (when (buffer-live-p buf)
                                       (with-current-buffer buf
                                         (and (eq major-mode the-mode)
                                              (buffer-name buf)))))
                                   (buffer-list)))))))

(defun ido-shell-buffer()
  "Open shell-mode buffers in own ido list"
  (interactive)
  (ido-for-mode "Shell:" 'shell-mode))
