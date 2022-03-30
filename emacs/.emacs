(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(package-refresh-contents)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(ivy helm all-the-icons-dired key-chord doom-modeline evil)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; UI settings
(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(set-fringe-mode 10)
(menu-bar-mode -1)
(setq visible-bell t)
(setq-default show-trailing-whitespace t)

;; Line numbers
(column-number-mode)
(setq display-line-numbers-type 'relative)

(defun absLinum ()
  (interactive)
  (display-line-numbers-mode)
  (message "Switched to absolute line numbers")
  (setq display-line-numbers-type 'absolute)
  (display-line-numbers-mode t)
)

(defun relLinum ()
  (interactive)
  (display-line-numbers-mode)
  (message "Switched to relative line numbers")
  (setq display-line-numbers-type 'relative)
  (display-line-numbers-mode t)
)

(defun linumOff ()
  (interactive)
  (display-line-numbers-mode)
  (message "Line numbers turned off")
  (setq display-line-numbers-type nil)
  (display-line-numbers-mode)
)

;; disable line numbers for some modes
;;(dolist (mode '(org-mode-hook
;; 		term-mode-hook
;; 		shell-mode-hook
;; 		eshell-mode-hook))
;;  (add-hook mode (lambda ()
;; 		   (display-line-number-mode)
;; 		   (setq display-line-numbers-mode nil)
;; 		   (display-line-numbers-mode))))

;; Enable Evil-mode
(unless (package-installed-p 'evil)
  (package-install 'evil))
(require 'evil)
(evil-mode 1)
;; Maybe there could be a hook or something that would turn on relative line
;; numbers only in evil-mode
(setq evil-default-state 'emacs)

(define-key evil-normal-state-map (kbd "<f1>") 'linumOff)
(define-key evil-normal-state-map (kbd "<f2>") 'absLinum)
(define-key evil-normal-state-map (kbd "<f3>") 'relLinum)

;; Enable doom-modeline
(unless (package-installed-p 'doom-modeline)
  (package-install 'doom-modeline))
(require 'doom-modeline)
(doom-modeline-mode 1)

;; Enable helm
(unless (package-installed-p 'ivy)
  (package-install 'ivy))
(require 'ivy)
(ivy-mode 1)

;; Enable Key-chord
(unless (package-installed-p 'key-chord)
  (package-install 'key-chord))
(require 'key-chord)
(key-chord-mode 1)
(setq key-chord-two-keys-delay 0.5)
(key-chord-define evil-insert-state-map "jk" 'evil-normal-state)

;; Make escape quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
