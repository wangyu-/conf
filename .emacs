(require 'package)

;; For first use:
;; M-x package-install ENTER spacemacs-theme
;; M-x package-install ENTER evil
;; M-x package-install ENTER beacon

;; add to bashrc or zshrc:
;; alias ec='emacsclient -a "" -t'

;; if ssl is avaliable use this:
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)

;; if ssl is unavaliable use this:
;;(let* ((no-ssl (not (gnutls-available-p)))
;;       (proto (if no-ssl "http" "https")))
;;  (when no-ssl (warn "\
;;Your version of Emacs does not support SSL connections,
;;which is unsafe because it allows man-in-the-middle attacks.
;;There are two things you can do about this warning:
;;1. Install an Emacs version that does support SSL and be safe.
;;2. Remove this warning from your init file so you won't see it again."))
;;  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
;;  ;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;;  ;; and `package-pinned-packages`. Most users will not need or want to do this.
;;  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
;;  )

(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#d2ceda" "#f2241f" "#67b11d" "#b1951d" "#3a81c3" "#a31db1" "#21b8c7" "#655370"])
 '(custom-enabled-themes '(whiteboard))
 '(hl-todo-keyword-faces
   '(("TODO" . "#dc752f")
     ("NEXT" . "#dc752f")
     ("THEM" . "#2d9574")
     ("PROG" . "#3a81c3")
     ("OKAY" . "#3a81c3")
     ("DONT" . "#f2241f")
     ("FAIL" . "#f2241f")
     ("DONE" . "#42ae2c")
     ("NOTE" . "#b1951d")
     ("KLUDGE" . "#b1951d")
     ("HACK" . "#b1951d")
     ("TEMP" . "#b1951d")
     ("FIXME" . "#dc752f")
     ("XXX+" . "#dc752f")
     ("\\?\\?\\?+" . "#dc752f")))
 '(inhibit-startup-screen t)
 '(package-selected-packages
   '(beacon helm ivy imenu-list ## sr-speedbar rainbow-delimiters spacemacs-theme evil))
 '(pdf-view-midnight-colors '("#655370" . "#fbf8ef")))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(rainbow-delimiters-depth-1-face ((t (:foreground "dark orange"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "deep pink"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "chartreuse"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "deep sky blue"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "yellow"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "orchid"))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "spring green"))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "sienna1")))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(load-theme 'spacemacs-dark t)
(global-hl-line-mode t)
(save-place-mode 1) 
;;(setq auto-save-default nil)
(add-to-list 'auto-mode-alist '("\\.cu\\'" . c++-mode))

;;(setq xterm-extra-capabilities nil)
(setq xterm-query-timeout nil)
;;(setq xterm-query-redisplay-timeout nil)
(setq scroll-conservatively 101)
(setq c-default-style "linux" c-basic-offset 4)
(c-set-offset 'inline-open '0)
;;(setq indent-tabs-mode t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;(setq evil-search-module 'evil-search)
(setq evil-disable-insert-state-bindings t)
(setq evil-want-C-u-scroll t)
(setq evil-insert-state-cursor 'bar )
;(setq evil-insert-state-cursor '(box "purple") )
(setq evil-want-fine-undo t)
(setq evil-normal-state-tag   (propertize " <N> " 'face '((:background "DarkGoldenrod2" :foreground "black")))
          evil-emacs-state-tag    (propertize " <E> " 'face '((:background "SkyBlue2"       :foreground "black")))
          evil-insert-state-tag   (propertize " <I> " 'face '((:background "chartreuse3"    :foreground "black")))
          evil-replace-state-tag  (propertize " <R> " 'face '((:background "chocolate"      :foreground "black")))
          evil-motion-state-tag   (propertize " <M> " 'face '((:background "plum3"          :foreground "black")))
          evil-visual-state-tag   (propertize " <V> " 'face '((:background "gray"           :foreground "black")))
          evil-operator-state-tag (propertize " <O> " 'face '((:background "sandy brown"    :foreground "black"))))
(require 'evil)
(evil-mode 1)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;(global-evil-tabs-mode t)

(evil-define-command my-hl (arg)
  (interactive "<a>")
  (highlight-regexp arg 'hi-green-b)
)
(evil-ex-define-cmd "hl" 'my-hl)

(evil-define-command my-uh (arg)
  (interactive "<a>")
  (unhighlight-regexp arg)
)
(evil-ex-define-cmd "uh" 'my-uh)
(evil-ex-define-cmd "paste" 'electric-indent-mode)
(evil-ex-define-cmd "eval" 'eval-expression)
;(setq evil-show-paren-range 100)
;(show-paren-mode)

;(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;(semantic-mode 1)
;(evil-ex-define-cmd "iml" 'imenu-list-smart-toggle)
;(add-hook 'after-make-frame-functions
          ;(lambda (new-f)
            ;(select-frame new-f)
            ;(imenu-list-smart-toggle)))
(beacon-mode 1)
;(setq-default show-trailing-whitespace t)

(global-so-long-mode 1)


 (add-hook 'so-long-hook 'my-so-long-hook)
 (defun my-so-long-hook ()
   "Used in `so-long-hook'."
   ;; Disable the old `idle-highlight' (pre-`idle-highlight-mode')
   (when (bound-and-true-p idle-highlight-timer)
     (cancel-timer idle-highlight-timer)
     (setq idle-highlight-timer nil)))
