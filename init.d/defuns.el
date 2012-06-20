;;; Various function I've written or grabbed to make my life nicer in Emacs
(defun ge ()
  "Open the emacs config directory dir"
  (interactive)
  (dired ajv-emacs-config-dir))

(defun today ()
  "Insert string for today's date nicely formatted in American style, e.g. Sunday September 17, 2000."
  (interactive)
  (insert (format-time-string "%A %B %e, %Y")))

(defun now ()
  "Insert string for the current time formatted like '2:34 PM'."
  (interactive)
  (insert (format-time-string "%-I:%M %p")))

(defun insert-empty-line ()
  "Add a newline after current line, and move cursor to newline"
  (interactive)
  (move-end-of-line nil)
  (open-line 1)
  (next-line 1)
  (indent-according-to-mode))

(defun duplicate-line()
  "Duplicates current line"
  (interactive)
  (kill-whole-line)
  (yank)(yank))

(defun ido-goto-symbol (&optional symbol-list)
  "Refresh imenu and jump to a function name in the buffer using Ido."
  (interactive)
  (unless (featurep 'imenu)
    (require 'imenu nil t))
  (cond
   ((not symbol-list)
    (let ((ido-mode ido-mode)
          (ido-enable-flex-matching
           (if (boundp 'ido-enable-flex-matching)
               ido-enable-flex-matching t))
          name-and-pos symbol-names position)
      (unless ido-mode
        (ido-mode 1)
        (setq ido-enable-flex-matching t))
      (while (progn
               (imenu--cleanup)
               (setq imenu--index-alist nil)
               (ido-goto-symbol (imenu--make-index-alist))
               (setq selected-symbol
                     (ido-completing-read "Symbol? " symbol-names))
               (string= (car imenu--rescan-item) selected-symbol)))
      (unless (and (boundp 'mark-active) mark-active)
        (push-mark nil t nil))
      (setq position (cdr (assoc selected-symbol name-and-pos)))
      (cond
       ((overlayp position)
        (goto-char (overlay-start position)))
       (t
        (goto-char position)))))
   ((listp symbol-list)
    (dolist (symbol symbol-list)
      (let (name position)
        (cond
         ((and (listp symbol) (imenu--subalist-p symbol))
          (ido-goto-symbol symbol))
         ((listp symbol)
          (setq name (car symbol))
          (setq position (cdr symbol)))
         ((stringp symbol)
          (setq name symbol)
          (setq position
                (get-text-property 1 'org-imenu-marker symbol))))
        (unless (or (null position) (null name)
                    (string= (car imenu--rescan-item) name))
          (add-to-list 'symbol-names name)
          (add-to-list 'name-and-pos (cons name position))))))))

(defun increment-number-in-line (&optional  n)
  "Increment all numbers in a line by 1, or prefix argument"
  (interactive "p")
  (save-excursion
    (beginning-of-line)
    (while (re-search-forward "\\([0-9]+\\)" (line-end-position) t)
      (replace-match (number-to-string (+ (string-to-number (match-string 1)) (if n n 1)))))))

(defun wrap-in-text (&optional arg)
  "Wrap marked region with a specified PREFIX AND SUFFIX."
  (interactive "P")
  (let (
        (prefix (read-from-minibuffer "prefix: "))
        (suffix (read-from-minibuffer "suffix: "))
        )
    (save-excursion
      (goto-char (region-beginning))
      (progn
        (insert prefix)
        (indent-according-to-mode)
        (if (eq arg nil) nil (newline-and-indent) )))

    (save-excursion
      (goto-char (region-end))
      (progn
        (if (eq arg nil) nil (newline-and-indent) )
        (insert suffix)
        (indent-according-to-mode)
        ))
    (indent-region (- (region-beginning) (length prefix)) (+ (region-end) (length suffix)))
    ))


(defun delete-file-at-point ()
  (interactive)
  (setq filename (ffap-prompter))
  (cond
   ((ffap-url-p filename)
    (let (current-prefix-arg)   ; w3 2.3.25 bug, reported by KPC
      (funcall ffap-url-fetcher filename)))
   ((and ffap-pass-wildcards-to-dired
         ffap-dired-wildcards
         (string-match ffap-dired-wildcards filename))
    (funcall ffap-directory-finder filename))
   ((and ffap-dired-wildcards
         (string-match ffap-dired-wildcards filename)
         find-file-wildcards
         ;; Check if it's find-file that supports wildcards arg
         (memq ffap-file-finder '(find-file find-alternate-file)))
    (delete-file (expand-file-name filename)) )))

(defun untabify-buffer ()
  (interactive)
  (untabify (point-min) (point-max)))

;; uniquify lines from emacs wiki
(defun uniquify-all-lines-region (start end)
  "Find duplicate lines in region START to END keeping first occurrence."
  (interactive "*r")
  (save-excursion
    (let ((end (copy-marker end)))
      (while
          (progn
            (goto-char start)
            (re-search-forward "^\\(.*\\)\n\\(\\(.*\n\\)*\\)\\1\n" end t))
        (replace-match "\\1\n\\2")))))

(defun uniquify-all-lines-buffer ()
  "Delete duplicate lines in buffer and keep first occurrence."
  (interactive "*")
  (uniquify-all-lines-region (point-min) (point-max)))
