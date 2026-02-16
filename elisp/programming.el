;;; programming.el begins

;; Setting in-buffer completion
(use-package corfu
  :ensure t
  :hook (after-init . global-corfu-mode)
  :bind (:map corfu-map ("<tab>" . corfu-complete))
  :config
  (setq tab-always-indent 'complete)
  (setq corfu-min-width 20)
  (setq corfu-popupinfo-delay '(1.25 . 0.5))
  :custom

  ; Allows cycling through candidates
  (corfu-cycle t)

  ; Enable auto completion
  (corfu-auto t)
  (corfu-auto-prefix 2)
  (corfu-auto-delay 0.2)
  (corfu-quit-at-boundary 'separator)
  (corfu-echo-documentation 0.25)

  ; Do not preview current candidate
  (corfu-preview-current 'insert)
  (corfu-preselect-first nil)
  
  ; Shows documentation
  (corfu-popupinfo-mode 1)

  ; Save completion history for better sorting
  (corfu-history-mode 1)

  ;; Sort by input history
  (with-eval-after-load 'savehist
    (corfu-history-mode 1)
    (add-to-list 'savehist-additional-variables 'corfu-history)))

;; Setting lsp client
(use-package eglot
  :ensure t
  :defer t
  :hook ((c-mode . eglot-ensure)
	 (c++-mode . eglot-ensure))
  :config
  (add-to-list 'eglot-server-programs '((c++-mode c-mode) "clangd")))

(provide 'programming)

;;; programming.el ends
