;; my emacs config

(setq custom-file "~/.emacs.d/custom.el")
(setq backup-directory-alist '(("." . "~/.emacs.d/baks")))
(setq create-lockfiles nil)
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/autosaves/" t)))

(setq c-default-style "ellemtel" c-basic-offset 4)
(setq-default indent-tabs-mode nil)

(global-set-key (kbd "C-x M-3") "#")  ; for macOS

(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(setq inhibit-startup-screen t)
(setq ring-bell-function 'ignore)
(setq confirm-kill-processes nil)

(require 'auctex)
(require 'pdf-tools)
(setq TeX-view-program-selection '((output-pdf "PDF Tools")))
(add-hook 'doc-view-mode-hook 'auto-revert-mode)
(setq preview-auto-cache-preamble t)

(load custom-file)

;; Commands I will forget (some are old):

;; * M-x eg-h (toggle inlay hints)
;; * C-x x t (toggle line wrapping or truncation)
;; * C-M-i (autocomplete [completion at point])
;; * M-/ (worse autocomplete [I think, dabbrev])
;; * M-q (redistribute line breaks in paragraph)
;; * M-x compile (compile)
;; * :mak (recompile)
;; * C-u C-SPC (move back to previous mark (similar to C-o))

;; * C-c C-v (view pdf in AUCTeX)

;; * C-z (toggle evil's emacs state)

;; * C-c C-z (toggle switch from R script to iESS[R] buffer)
;; * C-c C-c (abort current R command [iESS])
;; * C-c C-q (quit iESS process)

;; * C-c C-c (send current paragraph or function or highlighted region to ESS)
;; * C-RET (send current line to ESS)
;; * C-c C-b (send whole current buffer to ESS)

;; * C-c C-t w (ESS watch window)

;; * M-x make-d (make directory)
;; * M-x list-packages RET M-x package-install RET (install a package)
;; * M-x col (toggle column number mode)
;; * M-: (evaluate Emacs Lisp expression)
