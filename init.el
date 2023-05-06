(setq inhibit-startup-screen t)

(auto-save-mode 0)
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)

(ido-mode 1)
(ido-everywhere 1)

(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode 1)

(setq backup-directory-alist '(("." . "~/.emacs_saves")))
(setq auto-save-default nil)

(set-keyboard-coding-system 'utf-8)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(package-initialize)

(or (file-exists-p package-user-dir)
    (package-refresh-contents))

(setq package-list '(smex magit multiple-cursors doom-themes gruber-darker-theme))
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

(require 'smex)
(smex-initialize) ; Can be omitted. This might cause a (minimal) delay
		  ; when Smex is auto-initialized on its first run.

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(require 'multiple-cursors)
(global-set-key (kbd "C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C-.") 'mc/mark-next-like-this)
(global-set-key (kbd "C-;") 'mc/mark-previous-like-this)

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

(add-to-list 'default-frame-alist '(font . "Ubuntu Mono-16"))
(set-face-attribute 'default t :font "Ubuntu Mono-16")

(load-theme 'doom-one-light t)

(setq-default c-basic-offset 4)
(c-set-offset 'case-label '+)
