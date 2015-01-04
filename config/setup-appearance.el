;; Hide mouse interface
(menu-bar-mode -1)
(tool-bar-mode -1)

;; Set basic colors
(load-theme 'wombat)

;; Display column number in mode line
(column-number-mode t)

;; Appearance for all prog-modes
;; Display line numbers
(add-hook 'prog-mode-hook 'linum-mode)
;; Display fill-column-indicator
(add-hook 'prog-mode-hook 'fci-mode)

;; Make sure pos-tip is loaded. It's automatically used by extensions like ac if
;; available.
(require 'pos-tip)

(provide 'setup-appearance)
