;;
;; Filename: emacs
;;
;  This is the personal setting script of chrisvo1d for Emacs. Anyone is welcome to fork and try this set of emacs !
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;
;   Basically came from:
;        Emacs-Prelude
;
;   Including the services:
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Written by chrisvo1d
;; Version: 1.0
; First, you should have experience of using Emacs.
; You should use the pkg control to install Emacs(like apt-get install emacs or brew install emacs, don't worry it is covered below)
; Then follow the guide to put the emacs.d folder and emacs to the right place
;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;          basic seettings
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-to-list 'load-path "~/.emacs.d/personal/preload/")

(global-linum-mode t)
(setq linum-format "%2d ")
(fset 'yes-or-no-p 'y-or-n-p)

(setq-default make-backup-files nil)
(setq inhibit-startup-message t)
(setq visible-bell nil)
(setq make-backup-files nil)
(global-font-lock-mode t)
(show-paren-mode t)

;; scroll smoothly
(setq scroll-margin 3
 scroll-conservatively 10000)
(setq auto-save-default nil)


;; markdown-mode
(add-to-list 'custom-theme-load-path "~/.emacs.d/personal/preload/")
(autoload 'markdown-mode "markdown-mode"
    "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; use electric pair mode to help
(defun electric-pair ()
     "If at end of line, insert character pair without surrounding spaces.
     Otherwise, just insert the typed character."
     (interactive)
     (if (eolp) (let (parens-require-spaces) (insert-pair)) (self-insert-command 1)))
(electric-pair-mode 1)

;; use electric mode in Python
(add-hook 'python-mode-hook
               (lambda ()
                (define-key python-mode-map "\"" 'electric-pair)
                (define-key python-mode-map "\'" 'electric-pair)
                (define-key python-mode-map "(" 'electric-pair)
                (define-key python-mode-map "[" 'electric-pair)
                (define-key python-mode-map "{" 'electric-pair)))
;; try auto indent
(global-set-key (kbd "RET") 'newline-and-indent)

;; use python indent 
(add-hook 'python-mode-hook 'guess-style-guess-tabs-mode)
(add-hook 'python-mode-hook (lambda ()
                               (when indent-tabs-mode
                                  (guess-style-guess-tab-width))))

;; use google style C
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)

;; use c mode settings
;(c-toggle-auto-newline)
(add-hook 'c-mode-common-hook (lambda () (c-toggle-auto-hungry-state 1)))
;(add-hook 'c-mode-hook
;           '(lambda ()
;                           (c-set-style "Stroustrup")
;                           (c-toggle-auto-hungry-state 1)))


;; use the atom dark theme which is my favourite
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
;(load-theme 'atom-dark t)
(load-theme 'base16-default t)
;(require 'color-theme-tomorrow)
;(load-theme 'tomorrow-night t)
;(require 'color-theme-sanityinc-tomorrow)

;; use Wind Move (see more on EmacsWiki)
(when (fboundp 'windmove-default-keybindings)
   (windmove-default-keybindings))


;; use utf-8 coding to help with chinese
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

(setq default-tab-width 4)
(setq-default indent-tabs-mode nil)
(setq c-basic-offset 4)
(require 'cc-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;  You can add your own settings below !
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; for yasnippet
;(add-to-list 'load-path "~/.emacs.d/personal/preload/yasnippet")
;(require 'yasnippet)
;(yas-global-mode 1)

;; NeoTree
(add-to-list 'load-path "~/.emacs.d/personal/preload/neotree/")
(require 'neotree)
(global-set-key [f3] 'neotree-toggle)

;;Xshell
(global-set-key [(control h)] 'delete-backward-char)
(setq shift-select-mode nil) 
;; Make shifted direction keys work on the Linux console or in an xterm
 (when (member (getenv "TERM") '("linux" "xterm"))
   (dolist (prefix '("\eO" "\eO1;" "\e[1;"))
     (dolist (m '(("2" . "S-") ("3" . "M-") ("4" . "S-M-") ("5" . "C-")
                  ("6" . "S-C-") ("7" . "C-M-") ("8" . "S-C-M-")))
       (dolist (k '(("A" . "<up>") ("B" . "<down>") ("C" . "<right>")
                    ("D" . "<left>") ("H" . "<home>") ("F" . "<end>")))
         (define-key function-key-map
                     (concat prefix (car m) (car k))
                     (read-kbd-macro (concat (cdr m) (cdr k))))))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("8022cea21aa4daca569aee5c1b875fbb3f3248a5debc6fc8cf5833f2936fbb22" "a0fdc9976885513b03b000b57ddde04621d94c3a08f3042d1f6e2dbc336d25c7" "c56d90af9285708041991bbc780a073182cbe91721de17c6e7a8aac1380336b3" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
