;; load it up, fire it off...
(eval-after-load "color-theme"
  '(progn
     (load-library "color-theme-ir-black")
;     (load-library "zenburn")
;     (load-library "color-theme-twilight")
     (load-library "color-theme-solarized")
     (load-library "color-theme-railscasts")
     (color-theme-initialize)
;     (color-theme-solarized-dark)
     (color-theme-ir-black)
     ))


