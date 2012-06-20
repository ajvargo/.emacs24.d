;; load it up, fire it off...
(eval-after-load "color-theme"
  '(progn
     (load-library "color-theme-ir-black")
     (load-library "color-theme-solarized")
     (load-library "color-theme-railscasts")
     (color-theme-initialize)
;;     (color-theme-ir-black)
     (color-theme-tomorrow-night)
     ))
;     (load-library "color-theme-twilight")
;     (color-theme-solarized-dark)
;     (load-library "zenburn")


(set-cursor-color "DarkGoldenrod")
(set-face-background 'region "#151535")
