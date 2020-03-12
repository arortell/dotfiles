;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Adam Ortell"
      user-mail-address "arortell80@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "Iosevka" :size 14))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c g k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c g d') to jump to their definition and see how
;; they are implemented.

;; =====================================
;; Development
;; =====================================

(add-hook 'after-init-hook 'global-company-mode) 	;; enable comapny completion
(setq company-backends
       '((company-files			 		;; enable file completion
          company-yasnippet			 	;; snippets competion
          company-dabbrev-code
          company-keywords
          company-capf
          company-semantic
	        )))

 (setq company-idle-delay 0
        company-echo-delay 0
        company-quickhelp-delay 0
        company-dabbrev-downcase nil
        company-dabbrev-code-everywhere t
        company-dabbrev-code-modes t
        company-dabbrev-code-ignore-case t
        company-tooltip-align-annotations t
        company-minimum-prefix-length 2
        company-selection-wrap-around t
        )

(company-quickhelp-mode 1)				;; quickhelp for functions
(which-key-mode 1)					;; list of avalable keybinding
(electric-pair-mode 1)					;; auto close "{[("

;; Add yasnippet support for all company backends
(defvar company-mode/enable-yas t
    "Enable yasnippet for all backends.")
(defun company-mode/backend-with-yas (backend)
    (if (or (not company-mode/enable-yas) (and (listp backend) (member 'company-yasnippet backend)))
        backend
     (append (if (consp backend) backend (list backend))
             '(:with company-yasnippet))))

(setq company-backends (mapcar #'company-mode/backend-with-yas company-backends))

(elpy-enable)
(setq elpy-modules (delq 'elpy-module-company elpy-modules))

(add-hook 'python-mode-hook
          (lambda ()
            ;; explicitly load company for the occasion when the deferred
            ;; loading with use-package hasn't kicked in yet
            (company-mode)
            (add-to-list 'company-backends
                         (company-mode/backend-with-yas 'elpy-company-backend))))

(add-hook 'python-mode-hook 'anaconda-mode)

(eval-after-load "company"
 '(add-to-list 'company-backends '(company-anaconda :with company-capf)))

 (setq python-shell-interpreter "ipython"	;; use ipython as python shell
       python-shell-interpreter-args "-i")

(when (load "flycheck" t t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

(setq elpy-remove-modeline-lighter t)

(advice-add 'elpy-modules-remove-modeline-lighter
            :around (lambda (fun &rest args)
                      (unless (eq (car args) 'flymake-mode)
                        (apply fun args))))

;; Enable autopep8
(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

(use-package! doom-snippets
  :after yasnippet)

(use-package! yasnippet-snippets
  :after yasnippet)


(use-package! pkgbuild-mode
  :mode "\\PKGBUILD")



;; =====================================
;; Keybindings And Custom Functions
;; =====================================

(defun copy-line (arg) ;; Copy line without cut
  "Copy lines (as many as prefix argument) in the kill ring"
  (interactive "p")
  (kill-ring-save (line-beginning-position)
                  (line-beginning-position (+ 1 arg)))
  (message "%d line%s copied" arg (if (= 1 arg) "" "s")))

(global-set-key "\C-c\C-k" 'copy-line) ;; key binding to call copy-line function
(global-set-key "\C-k" 'kill-whole-line) ;; delete whole line
(global-set-key [f2] '+eshell/toggle)  ;; toggle terminal
(global-set-key "\M-;" 'comment-line)   ;; keybinding toggle terminal
(global-set-key [f5] 'neotree-toggle)   ;; keybinding toggle neotree
