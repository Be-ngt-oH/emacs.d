;; Add some directories to grep-find-ignored-directories
(require 'grep)
(eval-after-load "grep"
  '(progn
     (add-to-list 'grep-find-ignored-directories "bower_components")
     (add-to-list 'grep-find-ignored-directories "vendor")
     (add-to-list 'grep-find-ignored-directories "node_modules")
     (add-to-list 'grep-find-ignored-directories "elpa")))

;; Enable disabled commands
(put 'dired-find-alternate-file 'disabled nil)

(provide 'setup-blacklists)
