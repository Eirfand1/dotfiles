;; ======================
;; UI & Basic Settings
;; ======================

(setq inhibit-startup-message t)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(blink-cursor-mode 0)

(global-font-lock-mode 1)
(global-display-line-numbers-mode t)
(setq display-line-numbers-type 'relative)

(set-face-attribute 'default nil
                    :family "Iosevka Nerd Font Mono"
                    :height 140
                    :weight 'light)

(setq-default tab-width 4)
(setq ring-bell-function 'ignore)
(setq shell-file-name "/bin/bash")

;; ======================
;; Package Management
;; ======================

(require 'package)
(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
        ("gnu"   . "https://elpa.gnu.org/packages/")))
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)

;; ================
;; Themes & Looks
;; ================

(use-package doom-themes
  :config
  (load-theme 'doom-1337 t))

;; ==================
;; Dashboard
;; ==================

(use-package dashboard
  :config
  (setq dashboard-banner-logo-title "“Il faut imaginer Sisyphe heureux.” — Albert Camus"
        dashboard-center-content t
        dashboard-items '((recents  . 5)
                          (projects . 5)))
  (dashboard-setup-startup-hook))

;; ==================
;; Company Autocomplete
;; ==================

(use-package company
  :hook ((prog-mode . company-mode)
         (lsp-mode . company-mode))
  :config
  (setq company-idle-delay 0.1
        company-minimum-prefix-length 1))


;; ==================
;; LSP & Go Support
;; ==================

(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :hook ((go-mode . lsp-deferred)
         (js-mode . lsp-deferred))
  :config
  (setq lsp-enable-snippet t
        lsp-prefer-flymake nil
        lsp-completion-enable t
        lsp-auto-guess-root t
        lsp-enable-file-watchers nil
        lsp-headerline-breadcrumb-enable nil))

(setq lsp-eldoc-enable-hover nil)
(remove-hook 'eldoc-documentation-functions #'lsp-eldoc-function)
(setq eldoc-message-function #'ignore)


(use-package lsp-ui
  :commands lsp-ui-mode
  :config
  (setq lsp-ui-doc-enable t
        lsp-ui-doc-position 'at-point))

(unless (package-installed-p 'go-mode)
  (package-install 'go-mode))

(unless (package-installed-p 'company-go)
  (package-install 'company-go))

;; ==================
;; PDF Tools (Lazy Load)
;; ==================

(use-package pdf-tools
  :mode ("\\.pdf\\'" . pdf-view-mode)
  :config
  (pdf-tools-install)
  (pdf-loader-install))

;; ==================
;; EMMS (Music Player)
;; ==================

(use-package emms
  :defer t
  :config
  (require 'emms-setup)
  (emms-all)
  (setq emms-player-list '(emms-player-vlc)
        emms-source-file-default-directory "~/Music/"
        emms-mode-line-mode t
        emms-playing-time-display-mode t)
  (emms-mode-line 1))

;; ==================
;; Exec path (Mac/NS/X only)
;; ==================

(when (memq window-system '(mac ns x))
  (use-package exec-path-from-shell
    :config
    (exec-path-from-shell-initialize)))

;; ==================
;; Org-mode & Markdown Preview
;; ==================

(setq org-agenda-files '("~/org/"))

(defun markdown-html (buffer)
  (princ
   (with-current-buffer buffer
     (format "<!DOCTYPE html><html><title>Impatient Markdown</title><xmp theme=\"united\" style=\"display:none;\">%s</xmp><script src=\"http://ndossougbe.github.io/strapdown/dist/strapdown.js\"></script></html>"
             (buffer-substring-no-properties (point-min) (point-max))))
   (current-buffer)))

;; ==================
;; Custom Shell Shortcut
;; ==================

(defun my/split-and-shell ()
  "Split window vertically and open shell."
  (interactive)
  (split-window-right)
  (other-window 1)
  (let ((default-directory "~/"))
    (eshell)))

(global-set-key (kbd "C-c s") #'my/split-and-shell)
