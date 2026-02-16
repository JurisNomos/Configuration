;;; init.el begins

;; Set up the package manager
(setq custom-file (locate-user-emacs-file "custom.el"))
(load custom-file :no-error-if-file-is-missing)

(require 'package)
(package-initialize)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

(unless (package-installed-p 'use-package)
(package-refresh-contents)
(package-install 'use-package))

(add-to-list 'display-buffer-alist
             '("\\`\\*\\(Warnings\\|Compile-Log\\)\\*\\'"
               (display-buffer-no-window)
               (allow-no-window . t)))

;; Load path etc
(add-to-list 'load-path (locate-user-emacs-file "elisp"))

;; Startup
(require 'startup)

;; Misc
(require 'misc)

;; Generic
(require 'generic)

;; Programming
(require 'programming)

;;; init.el ends
