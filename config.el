;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Koki Yasuno"
      user-mail-address "beldeislie@gmail.com")

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
(setq doom-font (font-spec :family "Hack" :size 12 :weight 'semi-light)
      doom-variable-pitch-font (font-spec :family "sans" :size 13)
      doom-unicode-font (font-spec :family "Migu 1M" :size 12))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-material)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'visual)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(map! :n "U" #'undo-fu-only-redo)

(setq! doom-localleader-key ","
       doom-localleader-alt-key "M-,")

(setq! php-mode-coding-style 'psr2
       web-mode-markup-indent-offset 2)

(after! org
  (map! :localleader
        :map org-mode-map
        doom-localleader-key #'org-ctrl-c-ctrl-c)

  (setq! org-adapt-indentation nil
         org-babel-default-header-args
         (cons '(:noweb . "yes")
               (assq-delete-all :noweb org-babel-default-header-args))
         org-clock-in-switch-to-state "STRT"
         org-clock-out-remove-zero-time-clocks t
         org-startup-folded t
         org-startup-indented nil
         org-superstar-headline-bullets-list
         '(?⒈ ?⒉ ?⒊ ?⒋ ?⒌ ?⒍ ?⒎ ?⒏ ?⒐ ?⒑)
         org-superstar-remove-leading-stars t))

(use-package! pinentry
  :config
  (pinentry-start))

(use-package! valign
  :hook (org-mode . valign-mode))

(map! :map with-editor-mode-map
      :n "RET" #'with-editor-finish
      :n "q" #'with-editor-cancel)
