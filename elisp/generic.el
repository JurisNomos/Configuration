;;; generic.el begins

;; Delete the selected text upon text insertion
(use-package delsel
  :ensure nil
  :hook (after-init . delete-selection-mode))

;; Configure the minibuffer and related
(use-package vertico
  :ensure t
  :hook (after-init . vertico-mode))

(use-package marginalia
  :ensure t
  :hook (after-init . marginalia-mode))

(use-package orderless
  :ensure t
  :config
  (setq completion-styles '(orderless basic))
  (setq completion-category-defaults nil)
  (setq completion-category-overrides nil))

(use-package savehist
  :ensure t
  :hook (after-init . savehist-mode))

;; Tweak the dired
(use-package dired
  :ensure nil
  :commands (dired)
  :hook
  ((dired-mode . dired-hide-details-mode)
   (dired-mode . hl-line-mode))
  :config
  (setq dired-recursive-compies 'always)
  (setq dired-recursive-deletes 'always)
  (setq delete-by-moving-to-trash t)
  (setq dired-dwim-target t))

(use-package dired-subtree
  :ensure t
  :after dired
  :bind
  ( :map dired-mode-map
    ("<tab>" . dired-subtree-toggle)
    ("TAB" . dired-subtree-toggle)
    ("<backtab>" . dired-subtree-remove)
    ("S-TAB" . dired-subtree-remove))
  :config
  (setq dired-subtree-use-backgrounds nil))

;; Org setting
(use-package org
  :ensure t
  :pin gnu)

; Must do this so the agenda knows where to look for my files
(setq org-agenda-files '("~/Org"))

; When a todo is set to a done state, record a timestamp
(setq org-log-done 'time)

; Follow the links
(setq org-return-follows-link t)

; Associate all org files with org mode
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))

; Make the identation look nicer
(add-hook 'org-mode-hook 'org-indent-mode)

; Shortcuts for storing links, viewing the agenda, and starting a capture
(define-key global-map "\C-c l" 'org-store-link)
(define-key global-map "\C-c a" 'org-agenda)
(define-key global-map "\C-c c" 'org-capture)

; Hide the markers so you just see bold text as bold-text and not *bold-text*
(setq org-hide-emphasis-markers t)

; Wrap the lines in org mode so that things are easier to read
(add-hook 'org-mode-hook 'visual-line-mode)

; Org capture template
(setq org-capture-templates '(("l" "Log" entry (file + datetree "~/Org/Log.org")
                               "* %?" :empty-lines 0)
                              ("n" "Note" entry (file + headline "~/Org/Notes.org")
                               "** %?" :empty-lines 0)))

(provide 'generic)

;;; generic.el ends
