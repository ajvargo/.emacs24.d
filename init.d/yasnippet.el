(require 'yasnippet)
(setq yas/snippet-dirs (list (expand-file-name "snippets/" ajv-emacs-config-dir) (expand-file-name "yasnippet/snippets/" ajv-packages-dir)))
(yas/global-mode 1)
