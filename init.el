;; my emacs config

(setq custom-file "~/.emacs.d/custom.el")
(setq backup-directory-alist '(("." . "~/.emacs.d/baks")))
(setq create-lockfiles nil)
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/autosaves/" t)))

(setq c-default-style "ellemtel")
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

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

(defun thruse-tex-build ()
  (interactive)
  (compile "build")
  (TeX-view)
  (other-window 1))
(add-hook 'LaTeX-mode-hook
          (lambda ()
            (define-key LaTeX-mode-map (kbd "C-c b") 'thruse-tex-build)))

(load custom-file)

;; Commands I will forget (some are old):

;; * C-x x t (toggle line wrapping or truncation)
;; * C-M-i (autocomplete [completion at point])
;; * M-/ (worse autocomplete [I think, dabbrev])
;; * M-q (redistribute line breaks in paragraph)
;; * M-x compile (compile)
;; * C-u C-SPC (move back to previous mark (similar to C-o))

;; * C-c C-v (view pdf in AUCTeX)
;; * n (next page in pdfs)
;; * p (previous page in pdfs)
;; * H (fit pdf height to window)
;; * W (fit pdf width to window)
;; * P (fit pdf page to window)
;; * 0 (reset zoom of pdf)
;; * R (rotate pdf)

;; * M-x make-d (make directory)
;; * M-x list-packages RET M-x package-install RET (install a package)
;; * M-x col (toggle column number mode)
;; * M-: (evaluate Emacs Lisp expression)

;; * M-i (use this instead of TAB)
