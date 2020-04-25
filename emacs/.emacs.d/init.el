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

(use-package evil
    :ensure t
    :config
    (evil-mode)
    )

;; Remove menu/tool/scroll bar.
(tool-bar-mode -1)
(menu-bar-mode -1)
(if (boundp 'fringe-mode)
    (fringe-mode -1))
(if (boundp 'scroll-bar-mode)
    (scroll-bar-mode -1))
