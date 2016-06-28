(setq show-paren-delay 0)
(show-paren-mode t)
(setq show-paren-style 'parenthesis)

(setq-default indent-tabs-mode nil)
(setq column-number-mode t)
(setq line-number-mode t)

(global-font-lock-mode t)

(desktop-save-mode 1)

;;; Libraries that have no dependencies.
;;; Some of these are base dependencies for
;;; packages that are loaded later in this script.

(load "~/.emacs.d/htmlize/htmlize.el")
(setq htmlize-output-type 'inline-css)

(load "~/.emacs.d/prop-menu/prop-menu.el")

;;; Idris support (depends on prop-menu.el).

(add-to-list 'load-path "~/.emacs.d/idris-mode")
(load "~/.emacs.d/idris-mode/idris-mode.el")
(require 'idris-mode)

;(global-set-key (kbd "<C-tab>") 'next-buffer)
;(global-set-key (kbd "<C-S-tab>") 'previous-buffer)

;;; Steve Yegge's suggestions from his blog article at
;;; https://sites.google.com/site/steveyegge2/effective-emacs

; Use C-x C-m instead of M-x.
;(global-set-key "\C-x\C-m" 'execute-extended-command)
;(global-set-key "\C-c\C-m" 'execute-extended-command)

; Use these instead of reaching for the backspace key.
;(global-set-key "\C-w" 'backward-kill-word)
;(global-set-key "\C-x\C-k" 'kill-region)
;(global-set-key "\C-c\C-k" 'kill-region)

(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

;;; End of Steve Yegge's suggestions.

(global-linum-mode 1)

(setq inhibit-startup-message t
      inhibit-startup-echo-area-message t)

(defun maximize-frame ()
  "Maximizes the active frame in Windows"
  (interactive)
  ;; Send a `WM_SYSCOMMAND' message to the active frame with the
  ;; `SC_MAXIMIZE' parameter.
  (when (eq system-type 'windows-nt)
    (w32-send-sys-command 61488)))

(add-hook 'window-setup-hook 'maximize-frame t)

