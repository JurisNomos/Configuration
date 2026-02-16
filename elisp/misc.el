;;; misc.el begins

;; Set fonts
(let ((mono-spaced-font "IBM Plex Mono")
      (proportionately-spaced-font "IBM Plex Sans TC"))
  
  ; Standard faces
  (set-face-attribute 'default nil :family mono-spaced-font :height 120)
  (set-face-attribute 'fixed-pitch nil :family mono-spaced-font :height 1.0)
  (set-face-attribute 'variable-pitch nil :family proportionately-spaced-font :height 1.0)
  
  ; Chinese and character
  (dolist (character '(han symbol cjk-misc bopomofo))
    (set-fontset-font t character (font-spec :family proportionately-spaced-font))))

;; Set backup files location
(setq
   backup-by-copying t
   backup-directory-alist
   '(("." . "~/.emacs.d/tmp/"))
   delete-old-versions t
   kept-new-version 2
   kept-old-version 2
   version-control t)

;; Set auto-save files location
(setq auto-save-file-name-transforms
      '((".*" "~/.emacs.d/tmp/" t)))

;; Set lock files location
(setq
 lock-file-name-transforms
 '(("\\`/.*/\\([^/]+\\)\\'" "~/.emacs.d/tmp/\\1" t)))

;; Make ctrl-g a bit helpful
(defun keyboard-quit-dwim ()
  (interactive)
  (cond
   ((region-active-p)
    (keyboard-quit))
   ((derived-mode-p 'completion-list-mode)
    (delete-completion-window))
   ((> (minibuffer-depth) 0)
    (abort-recursive-edit))
   (t
    (keyboard-quit))))

(define-key global-map (kbd "C-g") #'keyboard-quit-dwim)

;; Make default setting better
(autoload 'zap-up-to-char "misc"
  "Kill up to, but not including ARGth occurrence of CHAR." t)

(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

(save-place-mode 1)

(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "M-z") 'zap-up-to-char)

(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)

(show-paren-mode 1)
(setq-default indent-tabs-mode nil)
(setq save-interprogram-paste-before-kill t
      apropos-do-all t
      mouse-yank-at-point t
      require-final-newline t
      visible-bell t
      load-prefer-newer t
      backup-by-copying t
      frame-inhibit-implied-resize t
      read-file-name-completion-ignore-case t
      read-buffer-completion-ignore-case t
      completion-ignore-case t)

(provide 'misc)

;;; misc.el ends
