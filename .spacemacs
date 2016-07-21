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
     sql
     rust
     vimscript
     html
     shell-scripts
     markdown
     yaml
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     ivy
     helm
     (auto-completion :variables
                      auto-completion-return-key-behavior nil
                      auto-completion-tab-key-behavior 'cycle
                      auto-completion-complete-with-key-sequence nil
                      auto-completion-complete-with-key-sequence-delay 0.1
                      auto-completion-private-snippets-directory nil)
     better-defaults
     bibtex
     rcirc
     dash
     org
     ranger
     emacs-lisp
     git
     (c-c++ :variables
            c-c++-default-mode-for-headers 'c++-mode)
     ((haskell :variables haskell-enable-ghci-ng-support t))
     scheme
     gtags
     java
     (python :variables
             python-test-runner '(nose pytest))
     (shell :variables
            shell-default-shell 'eshell
            shell-default-full-span nil
            shell-default-position 'left)
     ;; spell-checking
     syntax-checking
     ;; version-control
     ;; ycmd

     rebox

     ab-circe
     em-last

     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(evil-terminal-cursor-changer
                                      quickrun
                                      thrift
                                      )
   ;; A list of packages that will not be install and loaded.
   dotspacemacs-excluded-packages '(evil-escape)
   ;; Defines the behaviour of Spacemacs when downloading packages.
   ;; Possible values are `used', `used-but-keep-unused' and `all'. `used' will
   ;; download only explicitly used packages and remove any unused packages as
   ;; well as their dependencies. `used-but-keep-unused' will download only the
   ;; used packages but won't delete them if they become unused. `all' will
   ;; download all the packages regardless if they are used or not and packages
   ;; won't be deleted by Spacemacs. (default is `used')
   dotspacemacs-download-packages 'used-but-keep-unused))

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
   dotspacemacs-elpa-https nil
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. (default t)
   dotspacemacs-check-for-update t
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
   ;; List of items to show in startup buffer or an association list of of
   ;; the form `(list-type . list-size)`. If nil it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Ubuntu Mono"
                               :size 18
                               :weight normal
                               :width normal
                               :powerline-scale 1.0)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m)
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ t
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
   dotspacemacs-mode-line-unicode-symbols nil
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
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
   ;; If non nil advises quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server t
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
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  (defun dummy())
  (fset 'eldoc-mode #'dummy)
  (global-eldoc-mode -1)
  (fset 'global-eldoc-mode #'dummy)
  (xterm-mouse-mode -1)
  (global-company-mode)

  (setq-default
   powerline-default-separator 'alternate
   vc-follow-symlinks t
   require-final-newline t
   evil-shift-width 2
   evil-shift-round nil
   visible-cursor nil
   package-check-signature nil
   undo-tree-auto-save-history t
   undo-tree-history-directory-alist '((".*" . "~/.emacs.d/undo-files"))
   company-selection-wrap-around t
   company-frontends
   '(company-pseudo-tooltip-frontend
     company-echo-metadata-frontend)
   company-minimum-prefix-length 1
   ivy-height 30
   ycmd-server-command
   '("python" "/home/amos/ycmd/ycmd")
   ycmd-extra-conf-whitelist '("~/*")
   multi-term-program "/bin/bash"
   multi-term-switch-after-close nil
   ;; system-uses-terminfo nil
   ;; evil-emacs-state-modes nil
   reftex-default-bibliography '("~/zotero.bib")
   helm-bibtex-bibliography '("~/zotero.bib")
   helm-bibtex-pdf-field "file"
   helm-bibtex-notes-path "~/bibnotes.org"
   rust-enable-racer t
   )

  (defun on-after-init ()
    (interactive)
    (unless (display-graphic-p (selected-frame))
      (set-face-background 'default "unspecified-bg" (selected-frame))
      (set-face-background 'font-lock-comment-face "unspecified-bg" (selected-frame))
      (set-face-background 'font-lock-warning-face "unspecified-bg" (selected-frame))
      (require 'evil-terminal-cursor-changer)
      (setq evil-insert-state-cursor '("green" bar))
      ))
  (add-hook 'window-setup-hook #'on-after-init)
  (defun my/eshell-pop ()
    (interactive)
    (condition-case ex
        (let  ((buf (projectile-run-eshell)))
          (switch-to-buffer (other-buffer buf))
          (switch-to-buffer-other-window buf)
          )
      ('error (let ((buf (eshell)))
                (switch-to-buffer (other-buffer buf))
                (switch-to-buffer-other-window buf)
                )
              )
      )
    )
  (defun my/shell-pop ()
    (interactive)
    (condition-case ex
       (projectile-run-shell)
      ('error (shell))
      )
    (my/shell-sentinel)
    )
  (define-key spacemacs-default-map-root-map [remap kill-buffer] #'spacemacs/kill-this-buffer)
  (add-hook 'term-mode-hook 'toggle-truncate-lines)
  (defun my/eshell-history ()
    "Browse Eshell history."
    (interactive)
    (setq ivy-completion-beg (point))
    (setq ivy-completion-end (point))
    (ivy-read "Symbol name: "
              (delete-dups
               (ring-elements eshell-history-ring))
              :action #'ivy-completion-in-region-action))
  (defun read-lines (filePath)
    "Return a list of lines of a file at filePath."
    (with-temp-buffer
      (insert-file-contents filePath)
      (split-string (buffer-string) "\n" t)))
  (defun my/shell-history ()
    "Browse shell history."
    (interactive)
    (setq ivy-completion-beg (point))
    (setq ivy-completion-end (point))
    (ivy-read "Symbol name: "
              (nreverse (read-lines "~/.bash_history"))
              :action #'ivy-completion-in-region-action))

  (defun my/shell-sentinel ()
    (let ((process (get-buffer-process (current-buffer))))
      (when process
        (set-process-sentinel
         process
         (lambda (_proc change)
           (when (string-match-p "\\(?:finished\\|exited\\)" change)
             (quit-window t)))))))

  (defun company-eshell-history (command &optional arg &rest ignored)
    (interactive (list 'interactive))
    (cl-case command
      (interactive (company-begin-backend 'company-eshell-history))
      (prefix (and (eq major-mode 'eshell-mode)
                   (let ((word (company-grab-word)))
                     (save-excursion
                       (eshell-bol)
                       (and (looking-at-p (s-concat word "$")) word)))))
      (candidates (remove-duplicates
                   (->> (ring-elements eshell-history-ring)
                        (remove-if-not (lambda (item) (s-prefix-p arg item)))
                        (mapcar 's-trim))
                   :test 'string=))
      (sorted t)))

  (add-hook 'eshell-mode-hook
    (lambda ()
      (define-key evil-insert-state-local-map (kbd "C-r") #'my/eshell-history)
      (define-key evil-insert-state-local-map (kbd "C-d") #'eshell-delchar-or-maybe-eof)
      (define-key evil-insert-state-local-map (kbd "C-p") #'eshell-previous-input)
      (define-key evil-insert-state-local-map (kbd "C-n") #'eshell-next-input)
      (define-key evil-insert-state-local-map (kbd "C-k") #'evil-delete-line)
      (define-key evil-insert-state-local-map (kbd "M-.") #'eshell-insert-previous-argument)
      (define-key evil-insert-state-local-map (kbd "C-\@") #'quit-window)
      ;; (push #'company-eshell-history company-backends-eshell-mode)
      (setq company-frontends
      '(company-pseudo-tooltip-frontend
        company-echo-metadata-frontend)
      )
     )
   )

  (add-hook 'shell-mode-hook
    (lambda ()
      (define-key evil-normal-state-local-map (kbd "i") #'evil-insert-resume)
      (define-key evil-insert-state-local-map (kbd "C-d") #'comint-delchar-or-maybe-eof)
      )
    )
   (add-hook 'term-mode-hook
    (lambda ()
      (define-key evil-insert-state-local-map (kbd "C-p") #'term-send-raw)
      (define-key evil-insert-state-local-map (kbd "C-n") #'term-send-raw)
      (define-key evil-insert-state-local-map (kbd "C-h") #'term-send-raw)
      (define-key evil-insert-state-local-map (kbd "C-w") #'term-send-raw)
      (define-key evil-insert-state-local-map (kbd "C-d") #'term-send-raw)
      (define-key evil-insert-state-local-map (kbd "C-e") #'term-send-raw)
      (define-key evil-insert-state-local-map (kbd "C-u") #'term-send-raw)
      (define-key evil-insert-state-local-map (kbd "C-k") #'term-send-raw)
      (define-key evil-insert-state-local-map (kbd "C-r") #'term-send-raw)
      (define-key evil-insert-state-local-map (kbd "M-.") #'term-send-raw-meta)
      (define-key evil-insert-state-local-map (kbd "C-\@") #'quit-window)
      )
    )
  (add-hook 'c-mode-common-hook #'(lambda () (modify-syntax-entry ?_ "w")))

  (with-eval-after-load 'term
    (evil-make-overriding-map term-mode-map 'insert)
    (evil-make-overriding-map term-raw-map 'insert)
    (evil-make-overriding-map term-raw-escape-map 'insert)
    (custom-set-faces '(term ((t (:background "unspecified-bg")))))
    )
  (with-eval-after-load 'comint
    (define-key comint-mode-map (kbd "C-p") 'comint-previous-input)
    (define-key comint-mode-map (kbd "C-n") 'comint-next-input)
    (define-key comint-mode-map (kbd "C-k") 'kill-line))
  (with-eval-after-load 'shell
    (define-key shell-mode-map (kbd "C-e") #'move-end-of-line)
    (define-key shell-mode-map (kbd "C-r") #'my/shell-history)
    (define-key shell-mode-map (kbd "C-b") #'evil-backward-char)
    (define-key shell-mode-map (kbd "C-\@") 'quit-window))

  (define-key spacemacs-default-map-root-map (kbd "C-\@") 'my/shell-pop)
  (define-key evil-normal-state-map (kbd "0") 'evil-first-non-blank)
  (define-key evil-normal-state-map (kbd "-") 'evil-end-of-line)
  (define-key evil-visual-state-map (kbd "-") 'evil-end-of-line)
  (define-key evil-motion-state-map (kbd "f") 'avy-goto-char-2-below)
  (define-key evil-motion-state-map (kbd "F") 'avy-goto-char-2-above)
  (define-key evil-normal-state-map (kbd "q") 'quit-window)
  (define-key evil-normal-state-map (kbd "C-q") 'evil-record-macro)
  (define-key evil-normal-state-map (kbd "C-,") 'spacemacs/previous-error)
  (define-key evil-normal-state-map (kbd "C-.") 'spacemacs/next-error)
  (define-key evil-normal-state-map (kbd "C-k") 'evil-delete-line)
  (define-key evil-normal-state-map (kbd "TAB") 'evil-jump-forward)
  (define-key evil-insert-state-map (kbd "C-d") 'delete-char)
  (define-key evil-insert-state-map (kbd "C-u") '(lambda () (interactive) (kill-line 0)))
  (define-key evil-insert-state-map (kbd "C-a") nil)
  (define-key evil-insert-state-map (kbd "C-e") nil)
  (define-key evil-insert-state-map (kbd "C-k") nil)
  (define-key input-decode-map (kbd "M-9") "(")
  (define-key input-decode-map (kbd "M-0") ")")
  (define-key input-decode-map (kbd "M--") "_")
  (define-key input-decode-map (kbd "M-=") "+")
  (define-key input-decode-map (kbd "M-;") ":")
  (define-key input-decode-map (kbd "M-'") "\"")
  (define-key input-decode-map (kbd "M-\\") "|")
  (define-key evil-insert-state-map (kbd "M-0") nil)
  ;; (define-key ivy-minibuffer-map (kbd "C-d") 'ivy-scroll-up-command)
  ;; (define-key ivy-minibuffer-map (kbd "C-u") 'ivy-scroll-down-command)
  (define-key evil-normal-state-map (kbd "C-k") 'flycheck-previous-error)
  (define-key evil-normal-state-map (kbd "C-j") 'flycheck-next-error)
  (define-key evil-visual-state-map (kbd "M-y") 'copy-to-clipboard)
  (with-eval-after-load 'magit
    (define-key magit-status-mode-map (kbd "M-1") nil)
    (define-key magit-status-mode-map (kbd "M-2") nil)
    (define-key magit-status-mode-map (kbd "M-3") nil)
    (define-key magit-status-mode-map (kbd "M-4") nil)
    )

  (if (display-graphic-p (selected-frame))
      (define-key evil-insert-state-map (kbd "C-h") 'delete-backward-char)
    (define-key evil-ex-completion-map (kbd "C-h") 'delete-backward-char)
    ;; (define-key counsel-find-file-map (kbd "C-h") 'delete-backward-char)
    (define-key minibuffer-local-map (kbd "C-h") 'delete-backward-char)
    )
  (with-eval-after-load 'company
    (if (display-graphic-p (selected-frame))
        (define-key company-active-map (kbd "C-h") 'delete-backward-char)
      )
    (define-key company-active-map (kbd "C-w") 'backward-kill-word)
    (define-key company-active-map (kbd "C-u") '(lambda () (interactive) (kill-line 0)))
    )
  (with-eval-after-load 'projectile
    (push '("h" "c" "cc" "cpp" "ipp" "hpp" "cxx" "ixx" "hxx" "m" "mm")
          projectile-other-file-alist)
    (push '("cc" "h" "hpp") projectile-other-file-alist)
    )

  (setq helm-bibtex-pdf-open-function
        (lambda (fpath) (call-process "rifle" nil 0 nil fpath)))

  (add-hook 'TeX-mode-hook
            '(lambda ()
               (add-to-list 'TeX-view-program-list
                            '("Zathura"
                              ("zathura "
                               (mode-io-correlate " --synctex-forward %n:0:'%b' -x \"emacsclient +%{line} '%{input}'\" ")
                               " %o")
                              "zathura"))
               (add-to-list 'TeX-view-program-selection
                            '(output-pdf "Zathura"))))

  ;; (setq TeX-view-program-selection '((output-pdf "PDF Tools"))
  ;;       TeX-source-correlate-start-server t)
  ;; Update PDF buffers after successful LaTeX runs
  (add-hook 'TeX-after-TeX-LaTeX-command-finished-hook
            #'TeX-revert-document-buffer)

  (with-eval-after-load 'thrift
    (add-hook 'thrift-mode-hook 'helm-gtags-mode)
    (add-hook 'thrift-mode-hook
              (lambda ()
                (modify-syntax-entry ?< ".")
                (use-local-map spacemacs-thrift-mode-map-root-map)))
    (spacemacs/set-leader-keys-for-major-mode 'thrift-mode
      "gc" 'helm-gtags-create-tags
      "gd" 'helm-gtags-find-tag
      "gD" 'helm-gtags-find-tag-other-window
      "gf" 'helm-gtags-select-path
      "gg" 'helm-gtags-find-tag
      "gG" 'helm-gtags-find-tag-other-window
      "gi" 'helm-gtags-tags-in-this-function
      "gl" 'helm-gtags-parse-file
      "gn" 'helm-gtags-next-history
      "gp" 'helm-gtags-previous-history
      "gr" 'helm-gtags-find-rtag
      "gR" 'helm-gtags-resume
      "gs" 'helm-gtags-select
      "gS" 'helm-gtags-show-stack
      "gu" 'helm-gtags-update-tags))

  (defun copy-to-clipboard ()
    "Copies selection to x-clipboard."
    (interactive)
    (if (display-graphic-p)
        (progn
          (message "Yanked region to x-clipboard!")
          (call-interactively 'clipboard-kill-ring-save)
          )
      (if (region-active-p)
          (progn
            (shell-command-on-region (region-beginning) (region-end) "xsel -i -b")
            (message "Yanked region to clipboard!")
            (deactivate-mark))
        (message "No region active; can't yank to clipboard!")))
    )

  (defun paste-from-clipboard ()
    "Pastes from x-clipboard."
    (interactive)
    (if (display-graphic-p)
        (progn
          (clipboard-yank)
          (message "graphics active")
          )
      (insert (shell-command-to-string "xsel -o -b"))
      )
    )
 )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#080808" "#d70000" "#67b11d" "#875f00" "#268bd2" "#af00df" "#00ffff" "#b2b2b2"])
 '(custom-safe-themes
   (quote
    ("bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default)))
 '(package-selected-packages
   (quote
    (readline-complete sql-indent evil-unimpaired toml-mode racer rust-mode flycheck-rust vimrc-mode dactyl-mode thrift counsel-dash dash-functional org-projectile git-link web-mode tagedit slim-mode scss-mode sass-mode less-css-mode jade-mode helm-css-scss haml-mode emmet-mode company-web web-completion-data org-ref key-chord helm-bibtex parsebib biblio biblio-core rebox2 fish-mode company-shell helm-pydoc helm-dash geiser intero hlint-refactor hindent haskell-snippets flycheck-haskell company-ghci company-ghc ghc haskell-mode company-cabal cmm-mode flycheck-ycmd flycheck-pos-tip flycheck zeal-at-point quickrun anaconda-mode f rcirc-notify rcirc-color circe pythonic ranger pyvenv pytest pyenv-mode py-yapf pip-requirements org-repo-todo org-present org-pomodoro alert log4e gntp org-download mmm-mode markdown-toc markdown-mode live-py-mode hy-mode htmlize gnuplot gh-md cython-mode company-anaconda evil-terminal-cursor-changer yaml-mode powerline spinner hydra parent-mode helm helm-core flx smartparens iedit anzu evil goto-chg undo-tree highlight diminish projectile pkg-info epl s request bind-map bind-key packed dash async avy popup package-build disable-mouse xterm-color shell-pop multi-term gitignore-mode magit magit-popup git-commit with-editor eshell-z eshell-prompt-extras esh-help ycmd request-deferred deferred pos-tip company yasnippet auto-complete wgrep smex ivy-hydra counsel-projectile counsel swiper ivy ws-butler window-numbering which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spacemacs-theme spaceline smeargle restart-emacs rainbow-delimiters quelpa popwin persp-mode pcre2el paradox orgit org-plus-contrib org-bullets open-junk-file neotree mwim move-text magit-gitflow macrostep lorem-ipsum linum-relative link-hint info+ indent-guide ido-vertical-mode hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make helm-gtags helm-gitignore helm-flx helm-descbinds helm-company helm-c-yasnippet helm-ag google-translate golden-ratio gitconfig-mode gitattributes-mode git-timemachine git-messenger ggtags flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu emacs-eclim elisp-slime-nav disaster define-word company-ycmd company-statistics company-quickhelp company-c-headers column-enforce-mode cmake-mode clean-aindent-mode clang-format auto-yasnippet auto-highlight-symbol auto-compile aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell)))
 '(racer-rust-src-path "/usr/src/rust/src"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-group-tag ((t (:inherit variable-pitch :foreground "brightmagenta" :weight bold :height 1.2))))
 '(custom-variable-tag ((t (:foreground "brightmagenta" :weight bold))))
 '(term ((t (:foreground "#b2b2b2")))))
