;;; Advice for various defun-ery

;; Kill line when nothing is selected and killing
(defadvice kill-ring-save (before slick-copy activate compile)
  "When called interactively with no active region, copy a single line instead."
  (interactive
   (if (region-active-p) (list (region-beginning) (region-end))
     (message "Copied line")
     (list (line-beginning-position)
           (line-beginning-position 2)))))

(defadvice kill-region (before slick-cut activate compile)
  "When called interactively with no active region, kill a single line instead."
  (interactive
   (if (region-active-p) (list (region-beginning) (region-end))
     (list (line-beginning-position)
           (line-beginning-position 2)))))

(defadvice find-file-at-point (around goto-line compile activate)
  (let ((line (and (looking-at ".*:\\([0-9]+\\)")
                   (string-to-number (match-string 1)))))
    ad-do-it
    (and line (goto-line line))))

;; (defadvice find-file (around find-file-line-number
;;                              (filename &optional wildcards)
;;                              activate)
;;   "Turn files like file.cpp:14 into file.cpp and going to the 14-th line."
;;   (save-match-data
;;     (let* ((matched (string-match "^\\(.*\\):\\([0-9]+\\):?$" filename))
;;            (line-number (and matched
;;                              (match-string 2 filename)
;;                              (string-to-number (match-string 2 filename))))
;;            (filename (if matched (match-string 1 filename) filename)))
;;       ad-do-it
;;       (when line-number
;;         ;; goto-line is for interactive use
;;         (goto-char (point-min))
;;         (forward-line (1- line-number))))))

;; https://gist.github.com/1273463
;; Permits to indent like that :
;; class Comment < ActiveRecord::Base
;; after_create :send_email_to_author,
;; :if => :author_wants_emails?,
;; :unless => Proc.new { |comment| comment.post.ignore_comments? }
;; end
;;
(defadvice ruby-indent-line (after line-up-args activate)
  (let (indent prev-indent arg-indent)
    (save-excursion
      (back-to-indentation)
      (when (zerop (car (syntax-ppss)))
        (setq indent (current-column))
        (skip-chars-backward " \t\n")
        (when (eq ?, (char-before))
          (ruby-backward-sexp)
          (back-to-indentation)
          (setq prev-indent (current-column))
          (skip-syntax-forward "w_.")
          (skip-chars-forward " ")
          (setq arg-indent (current-column)))))
    (when prev-indent
      (let ((offset (- (current-column) indent)))
        (cond ((< indent prev-indent)
               (indent-line-to prev-indent))
              ((= indent prev-indent)
               (indent-line-to arg-indent)))
        (when (> offset 0) (forward-char offset))))))
