;;;;;;;;;;;;;;;;;
;;;; Imports ;;;;
;;;;;;;;;;;;;;;;;

(require 'package)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Miscellaneous settings ;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq show-paren-delay 0)
(show-paren-mode t)
(setq show-paren-style 'parenthesis)

(setq-default indent-tabs-mode nil)
(setq column-number-mode t)
(setq line-number-mode t)
(global-linum-mode 1)

(global-font-lock-mode t)
(desktop-save-mode 1)

(setq inhibit-startup-message t
      inhibit-startup-echo-area-message t)

(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

(defun maximize-frame ()
  "Maximizes the active frame in Windows"
  (interactive)
  ;; Send a `WM_SYSCOMMAND' message to the active frame with the
  ;; `SC_MAXIMIZE' parameter.
  (when (eq system-type 'windows-nt)
    (w32-send-sys-command 61488)))

(add-hook 'window-setup-hook 'maximize-frame t)

;; keep buffers open when leaving an emacs client
(setq server-kill-new-buffers nil)

;; scroll three lines at a time (less "jumpy" than defaults)
(setq mouse-wheel-scroll-amount '(3 ((shift) . 3)))
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time

;; show-server-buffers function

;; Shouldn't really be necessary because of (setq server-kill-new-buffers nil).
;; But it's still nice to have in case emacs thinks there's a client buffer
;; open and shows a dialog box stating "Emacs still has sessions open"
;; when trying to exit emacs.

(defun show-server-buffers ()
  (interactive)
  (let ((server-buffers)
        (original-buffer (current-buffer)))
    (dolist (buf (buffer-list))
      (switch-to-buffer buf)
      (when (and server-buffer-clients (buffer-live-p buf))
        (add-to-list 'server-buffers buf)))
    (switch-to-buffer original-buffer)
    (message "server-buffers: %s" server-buffers)))

;;;;;;;;;;;;;;;;;;
;;;; Packages ;;;;
;;;;;;;;;;;;;;;;;;

(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (cobol-mode php-mode fsharp-mode haskell-mode purescript-mode typescript-mode htmlize idris-mode csharp-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(server-start)

