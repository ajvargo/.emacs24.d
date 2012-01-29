(erc-autojoin-mode t)

(setq erc-autojoin-channels-alist
  '((".*\\.freenode.net" "#emacs" "#boston.rb" )))

;; check channels
(erc-track-mode t)
(setq erc-track-exclude-types '("JOIN" "NICK" "PART" "QUIT" "MODE"
                                "324" "329" "332" "333" "353" "477"))
;; don't show any of this
(setq erc-hide-list '("JOIN" "PART" "QUIT" "NICK"))

(defun erc-start-or-switch ()
  "Connect to ERC, or switch to last active buffer"
  (interactive)
  (if (get-buffer "irc.freenode.net:6667") ;; ERC already active?
      (erc-track-switch-buffer 1) ;; yes: switch to last active
    (when (y-or-n-p "Start ERC? ") ;; no: maybe start ERC
      (erc :server "irc.freenode.net" :port 6667 :nick "ajvargo" :full-name "Andrew Vargo"))))

(setq nick-face-list '())

;; Define the list of colors to use when coloring IRC nicks.                                                                     
(setq-default erc-colors-list '("blue" "green" "yellow"
                                "gray" "brown" "red"
                                "purple" "white" "cyan"))
(autoload 'erc-nick-colors "erc" "erc colors") 

(defun build-nick-face-list ()
  "build-nick-face-list builds a list of new faces using the                                                                     
foreground colors specified in erc-colors-list.  The nick faces                                                                  
created here will be used to format IRC nicks."
  (setq i -1)
  (setq nick-face-list
        (mapcar
         (lambda (COLOR)
           (setq i (1+ i))
           (list (custom-declare-face
                  (make-symbol (format "erc-nick-face-%d" i))
                  (list (list t (list :foreground COLOR)))
                  (format "Nick face %d" i))))
         erc-colors-list)))

(defun my-insert-modify-hook ()
  "This insert-modify hook looks for nicks in new messages and                                                                   
computes md5(nick) and uses substring(md5_value, 0, 4) mod (length                                                               
nick-face-list) to index the face list and produce the same face for a                                                           
given nick each time it is seen.  We get a lot of collisions this way,                                                           
unfortunately, but it's better than some other methods I tried.                                                                  
Additionally, if you change the order or size of the erc-colors-list,                                                            
you'll change the colors used for nicks."
  (if (null nick-face-list) (build-nick-face-list))
  (save-excursion
    (goto-char (point-min))
    (if (looking-at "<\\([^>]*\\)>")
        (let ((nick (match-string 1)))
          (put-text-property (match-beginning 1) (match-end 1)
                             'face (nth
                                    (mod (string-to-number
                                          (substring (md5 nick) 0 4) 16)
                                         (length nick-face-list))
                                    nick-face-list))))))

;; This adds the ERC message insert hook.                                                                                        
(add-hook 'erc-insert-modify-hook 'my-insert-modify-hook)
