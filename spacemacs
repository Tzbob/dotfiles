;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     ruby
     ocaml
     yaml
     vimscript
     deft
     vim-powerline

     (auto-completion :variables
                      auto-completion-enable-snippets-in-popup t
                      auto-completion-enable-sort-by-usage t
                      auto-completion-enable-help-tooltip t)
     (spell-checking :variables enable-flyspell-auto-completion t)

     syntax-checking
     better-defaults

     colors
     themes-megapack

     git
     version-control

     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom)

     markdown
     org

     emacs-lisp
     shell-scripts

     racket
     haskell
     javascript
     html
     elm
     scala
     latex
     python
     extra-langs
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages then consider to create a layer, you can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '()
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update 't
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-light
                         hemisu-light
                         material-light)
   ;; If non nil the cursor color matches the state color.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Fira Code"
                               :size 18
                               :width normal
                               :powerline-scale 1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key "["
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup 'changed
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration. You are free to put any user code."

  (setq browse-url-browser-function 'browse-url-chromium)
  (setq dired-dwim-target t)
  (setq dired-listing-switches "-alh")
  (setq git-magit-status-fullscreen t)
  (spacemacs/toggle-golden-ratio-on)

  ;; Auctex scale up previews
  (set-default 'preview-scale-function 2)

  ;; https://stackoverflow.com/questions/539984/how-do-i-get-emacs-to-fill-sentences-but-not-paragraphs
  (defun tzbob/fill-sentence ()
    (interactive)
    (save-excursion
      (or (eq (point) (point-max)) (forward-char))
      (forward-sentence -1)
      (indent-relative t)
      (let ((beg (point))
            (ix (string-match "LaTeX" mode-name)))
        (forward-sentence)
        (if (and ix (equal "LaTeX" (substring mode-name ix)))
            (LaTeX-fill-region-as-paragraph beg (point))
          (fill-region-as-paragraph beg (point))))))

  ;; Fill to line: http://www.cs.au.dk/~abizjak/emacs/2016/03/06/latex-fill-paragraph.html
  (defun ales/fill-paragraph (&optional P)
    "When called with prefix argument call `fill-paragraph'. Otherwise split the current paragraph into one sentence per line."
    (interactive "P")
    (if (not P)
        (save-excursion
          (let ((fill-column 12345678)) ;; relies on dynamic binding
            (fill-paragraph) ;; this will not work correctly if the paragraph is
            ;; longer than 12345678 characters (in which case the
            ;; file must be at least 12MB long. This is unlikely.)
            (let ((end (save-excursion
                         (forward-paragraph 1)
                         (backward-sentence)
                         (point-marker))))  ;; remember where to stop
              (beginning-of-line)
              (while (progn (forward-sentence)
                            (<= (point) (marker-position end)))
                (just-one-space) ;; leaves only one space, point is after it
                (delete-char -1) ;; delete the space
                (newline)        ;; and insert a newline
                (if (fboundp 'LaTeX-indent-line)
                    (LaTeX-indent-line))
                ))))
      ;; otherwise do ordinary fill paragraph
      (fill-paragraph P)))

  ;; Pop into a frame http://emacs.stackexchange.com/questions/7116/pop-a-window-into-a-frame
  (defun tzbob/pop-into-frame ()
    (interactive)
    (let ((buffer (current-buffer)))
      (unless (one-window-p)
        (delete-window))
      (display-buffer-pop-up-frame buffer nil)))

  ;; start processes
  (defun tzbob/termite () (interactive) (start-process "gnome-terminal" nil "gnome-terminal"))

  (require 'ansi-color)
  (defun display-ansi-colors ()
    (interactive)
    (ansi-color-apply-on-region (point-min) (point-max)))

  ;; jump dired
  (defun tzbob/home-dired () (interactive) (dired "~/"))
  (defun tzbob/dropbox-dired () (interactive) (dired "~/Dropbox/"))
  (defun tzbob/notes-dired () (interactive) (dired "~/Dropbox/notes"))
  (defun tzbob/downloads-dired () (interactive) (dired "~/Downloads/"))
  (defun tzbob/dotfiles-dired () (interactive) (dired "~/.dotfiles/"))
  (defun tzbob/torrents-dired () (interactive) (dired "~/Torrents/"))

  (evil-leader/set-key
    "oa" 'display-ansi-colors
    "/"   'spacemacs/helm-project-smart-do-search-region-or-symbol
    "asx" 'tzbob/termite
    "wx"  'tzbob/pop-into-frame
    "o."  'tzbob/dotfiles-dired
    "op"  'tzbob/dropbox-dired
    "on"  'tzbob/notes-dired
    "ot"  'tzbob/torrents-dired
    "oh"  'tzbob/home-dired
    "rf"  'ales/fill-paragraph
    "od"  'tzbob/downloads-dired)
  (setq powerline-default-separator 'arrow)

  (setq helm-locate-fuzzy-match nil)

  ;; AUCTeX options
  (setq reftex-plug-into-AUCTeX t)
  (setq TeX-view-program-selection '((output-pdf "zathura")))
  (setq magic-latex-enable-block-highlight t
        magic-latex-enable-suscript        nil
        magic-latex-enable-pretty-symbols  t
        magic-latex-enable-block-align     nil
        magic-latex-enable-inline-image    t
        magic-latex-enable-minibuffer-echo t)

  (add-hook 'TeX-mode-hook 'TeX-source-correlate-mode)
  (add-hook 'TeX-mode-hook
            (function (lambda ()
                        (add-to-list 'TeX-view-program-list
                                     '("zathura"
                                       "zathura -x \"emacsclient --no-wait +%%{line} %%{input}\" --synctex-forward \"%n:0:%b\" %s.pdf")))))

  ;; spaceline features
  (spaceline-toggle-minor-modes-off)
  (spaceline-toggle-hud-off)

  (spaceline-helm-mode)
  (spaceline-info-mode)

  ;; disable annoying highlights
  (spacemacs/toggle-highlight-current-line-globally-off)
  (setq sp-highlight-wrap-overlay nil)
  (setq sp-highlight-pair-overlay nil)
  (setq sp-highlight-wrap-tag-overlay nil)

  (spacemacs/set-leader-keys-for-major-mode 'org-mode "g" (lambda () "" (interactive) (org-beamer-export-to-pdf 't)))

  (setq load-path (cons "/usr/local/share/hop/site-lisp" load-path))
  (autoload 'hopjs-mode-hook "hopjs" "Hop.js javascript mode hook" t)
  (add-hook 'js-mode-hook 'hopjs-mode-hook)
)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(evil-want-Y-yank-to-eol nil)
 '(package-selected-packages
   (quote
    (flyspell-popup lv white-sand-theme rebecca-theme org-mime exotica-theme fringe-helper git-gutter+ epl flx transient reformatter bind-map popup rvm ruby-tools ruby-test-mode rubocop rspec-mode robe rbenv rake minitest chruby bundler inf-ruby utop tuareg caml ocp-indent merlin winum unfill solarized-theme madhat2r-theme fuzzy zenburn-theme yapfify yaml-mode ws-butler which-key web-mode vimrc-mode use-package ujelly-theme toc-org tao-theme tangotango-theme tango-plus-theme sublime-themes spaceline slim-mode shell-pop scad-mode restart-emacs rainbow-mode rainbow-delimiters racket-mode faceup pyvenv pytest pyenv-mode pug-mode powerline pip-requirements phoenix-dark-pink-theme phoenix-dark-mono-theme persp-mode orgit organic-green-theme org-projectile org-category-capture org org-pomodoro alert log4e org-plus-contrib org-download org-bullets obsidian-theme neotree mustang-theme move-text monokai-theme moe-theme mmm-mode material-theme markdown-toc markdown-mode magit-gitflow magic-latex-buffer live-py-mode link-hint julia-mode json-mode js2-refactor multiple-cursors jbeans-theme jazz-theme intero insert-shebang inkpot-theme info+ indent-guide hy-mode hungry-delete htmlize hlint-refactor hl-todo hindent highlight-parentheses highlight-numbers highlight-indentation hide-comnt help-fns+ helm-swoop helm-projectile helm-make projectile helm-gitignore request helm-flx helm-company helm-c-yasnippet helm-ag gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme google-translate gitconfig-mode gitattributes-mode git-timemachine git-link git-gutter-fringe flycheck-pos-tip flycheck-haskell flatland-theme fish-mode fill-column-indicator eyebrowse expand-region exec-path-from-shell evil-surround evil-search-highlight-persist evil-nerd-commenter evil-mc evil-matchit evil-magit magit magit-popup ghub let-alist evil-exchange evil-escape evil-ediff evil-anzu espresso-theme eshell-z eshell-prompt-extras esh-help ensime sbt-mode scala-mode elm-mode dumb-jump dracula-theme diminish diff-hl deft define-word darktooth-theme autothemer darkokai-theme darkburn-theme dakrone-theme cython-mode cyberpunk-theme company-web company-statistics company-shell company-quickhelp company-ghc ghc company-cabal column-enforce-mode color-theme-sanityinc-tomorrow color-identifiers-mode coffee-mode clean-aindent-mode busybee-theme bind-key auto-compile packed auctex-latexmk apropospriate-theme alect-themes aggressive-indent adaptive-wrap ace-window ace-link auto-complete avy anaconda-mode auctex haskell-mode dash-functional tern company highlight iedit smartparens f evil goto-chg undo-tree flycheck flyspell-correct git-commit with-editor yasnippet helm helm-core async skewer-mode js2-mode simple-httpd hydra haml-mode dash s spacemacs-theme zonokai-theme zen-and-art-theme xterm-color wolfram-mode window-numbering web-completion-data web-beautify volatile-highlights vi-tilde-fringe uuidgen underwater-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme tronesque-theme toxi-theme thrift tango-2-theme tagedit sunny-day-theme subatomic256-theme subatomic-theme stan-mode spacegray-theme soothe-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme smeargle seti-theme scss-mode sass-mode reverse-theme rainbow-identifiers railscasts-theme quelpa qml-mode pythonic py-isort purple-haze-theme professional-theme pos-tip popwin planet-theme pkg-info pcre2el pastels-on-dark-theme parent-mode paradox org-present open-junk-file omtose-phellack-theme oldlace-theme occidental-theme noflet noctilux-theme niflheim-theme naquadah-theme mwim multi-term monochrome-theme molokai-theme minimal-theme matlab-mode majapahit-theme macrostep lush-theme lorem-ipsum livid-mode linum-relative light-soap-theme less-css-mode json-snatcher json-reformat js-doc ir-black-theme ido-vertical-mode heroku-theme hemisu-theme helm-themes helm-pydoc helm-mode-manager helm-hoogle helm-descbinds helm-css-scss hc-zenburn-theme haskell-snippets golden-ratio gnuplot gntp gitignore-mode git-messenger git-gutter-fringe+ git-gutter gh-md gandalf-theme flyspell-correct-helm flycheck-elm flx-ido flatui-theme firebelly-theme farmhouse-theme fancy-battery evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-numbers evil-lisp-state evil-indent-plus evil-iedit-state evil-args eval-sexp-fu emmet-mode elisp-slime-nav django-theme darkmine-theme dactyl-mode company-tern company-ghci company-auctex company-anaconda color-theme-sanityinc-solarized cmm-mode clues-theme cherry-blossom-theme bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme auto-yasnippet auto-highlight-symbol auto-dictionary arduino-mode anzu anti-zenburn-theme ample-zen-theme ample-theme afternoon-theme ace-jump-helm-line ac-ispell)))
 '(safe-local-variable-values (quote ((TeX-command-extra-options . "-shell-escape")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil)))))
