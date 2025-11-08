;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-laserwave)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Documents/org/")

;; custome font
(setq doom-font (font-spec :family "JetBrainsMono Nerd Font" :size 16 :weight 'regular)
      doom-variable-pitch-font (font-spec :family "JetBrainsMono Nerd Font" :size 14))

;; eww config
;; Set hotkey
(map! :leader
      :desc "Open eww browser" "o w" #'eww)
;; Set homepage
(setq eww-homepage "https://en.wikipedia.org/wiki/The_Lord_of_the_Rings")

;; Toggle block comment
(map! :leader
      :desc "Toggle block comment" "b /" #'comment-or-uncomment-region)

;; Run stylish-haskell on save
(setq haskell-stylish-on-save t)

;; Open Haskell REPL with a keybinding(leader + h + r)
(map! :leader
      :desc "Open Haskell REPL" "h r" #'+haskell/open-repl)

;; Compile Haskell with a keybinding(leader + h + c)
(map! :leader
      :desc "Compile Haskell Project" "h c" #'haskell-compile)

;; Evaluate entire Ocaml buffer using utop
(map! :leader
      :desc "Evaluate entire Ocaml buffer" "m e" #'utop-eval-buffer)

;; Evaluate Ocaml region using utop
(map! :leader
      :desc "Evaluate Ocaml region" "m r" #'utop-eval-region)

;; Add official grammar sources for treesit
(setq treesit-language-source-alist
      '((bash . ("https://github.com/tree-sitter/tree-sitter-bash"))
        (c . ("https://github.com/tree-sitter/tree-sitter-c"))
        (cpp . ("https://github.com/tree-sitter/tree-sitter-cpp"))
        (cmake . ("https://github.com/uyha/tree-sitter-cmake"))
        (python . ("https://github.com/tree-sitter/tree-sitter-python"))
        (json . ("https://github.com/tree-sitter/tree-sitter-json"))
        (yaml . ("https://github.com/ikatyang/tree-sitter-yaml"))
        (rust . ("https://github.com/tree-sitter/tree-sitter-rust"))
        (toml . ("https://github.com/tree-sitter/tree-sitter-toml"))))

;; accept completion from copilot and fallback to company
;; (use-package! copilot
;;   :hook (prog-mode . copilot-mode)
;;   :bind (:map copilot-completion-map
;;               ("<tab>" . 'copilot-accept-completion)
;;               ("TAB" . 'copilot-accept-completion)
;;               ("C-TAB" . 'copilot-accept-completion-by-word)
;;               ("C-<tab>" . 'copilot-accept-completion-by-word)))

(defun +music/spotify ()
  "Launch spotify inside a vterm buffer."
  (interactive)
  (if (get-buffer "*ncspot*")
      (switch-to-buffer "*ncspot*")
    (vterm "*ncspot*")
    (vterm-send-string "ncspot\n")))

;; Hot key for opening spotify
(map! :leader
      :desc "Open spotify" "o s" #'+music/spotify)

;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
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
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
