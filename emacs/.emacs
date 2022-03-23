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
 '(package-selected-packages '(all-the-icons-dired key-chord doom-modeline evil)))
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
(setq show-trailing-whitespace t)

;; Line numbers
(column-number-mode)
(global-display-line-numbers-mode t)

;; Need to add a shortcut to change line number type
(setq display-line-numbers-type 'relative)

(defun abslinum ()
  (interactive)
  (message "Deactivated line numbers")
  (setq display-line-numbers-type 'absolute)
)

;; disable line numbers for some modes
(dolist (mode '(org-mode-hook
		term-mode-hook
		shell-mode-hook
		eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode))))

;; Enable Evil-mode
(require 'evil)
(evil-mode 1)
;; Maybe there could be a hook or something that would turn on relative line
;; numbers only in evil-mode
(setq evil-default-state 'emacs)

(define-key evil-normal-state-map (kbd "<f2>") 'display-line-numbers)

;; Enable doom-modeline
(require 'doom-modeline)
(doom-modeline-mode 1)

;; Enable Key-chord
(require 'key-chord)
(key-chord-mode 1)
(setq key-chord-two-keys-delay 0.5)
(key-chord-define evil-insert-state-map "jk" 'evil-normal-state)

;; Make escape quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
