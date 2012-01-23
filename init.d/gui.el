(menu-bar-mode -1) ; no menu bar
(tool-bar-mode -1) ; no tool bar
(scroll-bar-mode -1) ; no scroll bar
(setq ring-bell-function 'ignore) ; turn off bells of all sorts
(mouse-avoidance-mode 'jump) ; banish exile none
(setq-default indent-tabs-mode nil) ; tab are of the devil
(setq default-tab-width 2) ; how many spaces should my tab be?
(normal-erase-is-backspace-mode 1) ; delete works as it should

; Display time and date on the modeline
(setq display-time-day-and-date t)
(display-time)

(setq ns-command-modifier (quote meta)) ; Command is meta in OS X

(global-hl-line-mode t) ; Highlight the current line
(blink-cursor-mode t) ; durr
(setq default-cursor-type 'box) ; double dur
(column-number-mode t) ; show columns in modeline
(show-paren-mode t) ; see the matching parens
(setq-default indent-tabs-mode nil) ; no tabs, space only
(setq frame-title-format (list " %b %+%+  %f")) ; buffer title
(setq scroll-step 1) ; the way I scroll

;; set the font
(if (eq system-type 'darwin)
    (set-default-font "-apple-Inconsolata-medium-normal-normal-*-14-*-*-*-m-0-iso10646-1"))