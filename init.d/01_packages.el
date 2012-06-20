(require 'package)
(setq package-archives '(("ELPA" . "http://tromey.com/elpa/")
                         ("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("tromey" . "http://tromey.com/elpa/")))
(package-initialize)

(add-to-list 'load-path (expand-file-name "arduino-mode" ajv-emacs-modules-dir))
(require 'arduino-mode)

(add-to-list 'load-path (expand-file-name "el-get" ajv-emacs-modules-dir))
(setq el-get-dir ajv-packages-dir)
(require 'el-get)

(setq el-get-sources
      '())

;; list all packages you want installed
(setq my-el-get-packages
      (append
       '(autopair
         color-theme-ir-black
         color-theme-railscasts
         color-theme-solarized
         color-theme-tomorrow
         confluence-el
         drag-stuff
         git-blame
         git-modeline
;         inf-ruby
         magit
         markdown-mode
         moz-repl
         org-mode
         powerline
         rhtml-mode
         rinari
         rspec-mode
;         ruby-compilation
         rvm
         scss-mode
         xml-rpc-el
         weblogger-el
         yaml-mode
         yasnippet
         )
       (mapcar 'el-get-source-name el-get-sources)))

;; maybe?
;; emms

(el-get 'sync my-el-get-packages)

(add-to-list 'load-path (expand-file-name "jira" ajv-emacs-modules-dir))
(require 'jira)
