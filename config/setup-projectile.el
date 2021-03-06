(require 'projectile)
(projectile-mode)

(setq projectile-completion-system 'ivy)

(define-key projectile-mode-map (kbd "C-x f") 'projectile-find-file)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

(defun run-shell-command-with-file-name (command)
  "Invoke a shell command with the current file."
  (interactive "sCommand: ")
  (projectile-with-default-dir
      (projectile-project-root) (compile
                                 (concat command " " (buffer-file-name)))))
(defun run-shell-command-with-file-name-and-line (command)
  "Invoke a shell command with the current file name and line separated by a colon."
  (interactive "sCommand: ")
  (projectile-with-default-dir
      (projectile-project-root) (compile
                                 (concat command " " (buffer-file-name) ":" (number-to-string (line-number-at-pos))))))

(defun projectile-copy-filepath-as-kill ()
  "Copy the path of the current buffer file name in relation to the project root."
  (interactive)
  (let ((string (file-relative-name (buffer-file-name) (projectile-project-root))))
    (kill-new string)
    (message "%s" string)))

;; The MacOS filesystem is case insensitive so my workspace/ directory matches
;; the marker file for Bazel
(if (string-equal system-type "darwin") (delete "WORKSPACE" projectile-project-root-files))

(provide 'setup-projectile)
