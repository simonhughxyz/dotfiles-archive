(require 'package)
 
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
 
(setq package-enable-at-startup nil)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(use-package gruvbox-theme
    :ensure t
    :config
    (set-foreground-color "#E0DFDB")
    (set-background-color "#101010")
)
(use-package evil
    :ensure t
    :config
    (evil-mode)
    )

;; Minimal startup
(setq inhibit-startup-message t)
(setq inhibit-splash-screen t)
(setq initial-scratch-message nil)

;; Remove menu/tool/scroll bar.
(tool-bar-mode -1)
(menu-bar-mode -1)
(if (boundp 'fringe-mode)
    (fringe-mode -1))
(if (boundp 'scroll-bar-mode)
    (scroll-bar-mode -1))

;; Line Numbers
(when (version<= "26.0.50" emacs-version )
    (global-display-line-numbers-mode)
    (setq display-line-numbers-type 'relative
      display-line-numbers-current-absolute t))
