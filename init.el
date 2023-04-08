(package-initialize)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(require 'smex)   ; Not needed if you use package.el
(smex-initialize) ; Can be omitted. This might cause a (minimal) delay
                  ; when Smex is auto-initialized on its first run.

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; modes
(auto-save-mode 0)
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(global-display-line-numbers-mode 1)
(ido-everywhere 1)
(ido-mode 1)

(setq backup-directory-alist '(("." . "~/.emacs_saves")))
(setq auto-save-default nil)   ; stop create #autosave# files
(setq inhibit-startup-screen t)
(setq display-line-numbers-type 'relative)
(load-theme 'gruber-darker t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(php-mode smex gruber-darker-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :extend nil :stipple nil :background "#181818" :foreground "#e4e4ef" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 155 :width normal :foundry "ADBO" :family "Iosevka")))))

;; set C tabulation offset to 4 instead of 2
(setq-default c-basic-offset 4)
(c-set-offset 'case-label '+)

;; accented characters
(set-keyboard-coding-system 'utf-8)

;; duplicate line keybind
(defun duplicate-line ()
  (interactive)
  (copy-to-register 'a
		    (line-beginning-position)
		    (line-end-position))
  (move-end-of-line nil)
  (electric-newline-and-maybe-indent)
  (insert-register 'a)
  (move-beginning-of-line nil))

;; custom keybinds
(global-set-key (kbd "C-c d") 'duplicate-line)
