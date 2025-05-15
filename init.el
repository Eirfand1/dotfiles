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

(setq scroll-conservatively 10)
(setq scroll-margin 7)

(set-face-attribute 'default nil
                    :family "Iosevka Nerd Font Mono"
                    :height 120
                    :weight 'regular)

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
  (load-theme 'gruber-darker t))

;; ==================
;; Dashboard
;; ==================

(use-package dashboard
  :config
  (setq dashboard-banner-logo-title "“Il faut imaginer Sisyphe heureux.”  — Albert Camus"
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
        company-minimum-prefix-length 1
        
        
        company-frontends '(company-pseudo-tooltip-frontend)
        
        
        company-show-quick-access t
        company-tooltip-minimum-width 40
        company-tooltip-align-annotations t
        company-tooltip-flip-when-above t
        
        
        company-show-numbers t
        company-echo-metadata-frontend nil))

;; ==================
;; LSP Support
;; ==================


(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :hook ((go-mode . lsp-deferred)
         (js-mode . lsp-deferred)
		 (php-mode . lsp-defered)
		 (php-ts-mode-run-php-webserver . lsp-defered)
		 (php-ts-mode . lsp-defered)
		 )
  :config
  (setq lsp-enable-snippet t
        lsp-prefer-flymake nil
        lsp-completion-enable t
        lsp-auto-guess-root t
        lsp-enable-file-watchers nil
		lsp-eldoc-hook nil
		lsp-eldoc-enable-hover nil
		lsp-signature-auto-activate nil
        lsp-headerline-breadcrumb-enable nil
		lsp-signature-render-documentation nil
		))


(global-eldoc-mode -1)
(setq eldoc-echo-area-use-multiline-p nil)
(remove-hook 'eldoc-documentation-functions #'lsp-eldoc-function)
(setq eldoc-message-function #'ignore)

(use-package lsp-ui
  :commands lsp-ui-mode
  :config
  
  (setq
   lsp-ui-doc-enable t
   lsp-ui-doc-position 'at-point
  
  ))

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

;; ===========================
;; Custom Shortcut or whatever
;; ===========================

(defun my/split-and-shell ()
  "Split window vertically and open shell."
  (interactive)
  (split-window-right)
  (other-window 1)
  (let ((default-directory "~/"))
    (eshell)))

(global-set-key (kbd "C-c s") #'my/split-and-shell)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(gruber-darker))
 '(custom-safe-themes
   '("01a9797244146bbae39b18ef37e6f2ca5bebded90d9fe3a2f342a9e863aaa4fd"
	 default))
 '(package-selected-packages
   '(company-go dashboard doom-themes emms exec-path-from-shell
				flymake-go go-autocomplete gruber-darker-theme
				impatient-mode lsp-ui multiple-cursors pdf-tools
				php-mode typit)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; like "yy p" in vim
(defun duplicate-line()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (open-line 1)
  (next-line 1)
  (yank)
  )
(global-set-key (kbd "C-,") 'duplicate-line)

;; like "o" in vim
(defun make-newline-below()
  (interactive)
  (unless (eolp)
    (end-of-line))
  (newline-and-indent))
(global-set-key (kbd "C-o") 'make-newline-below)

;; like "O" in vim

(defun make-newline-above()
  (interactive)
  (unless (bolp)
	(beginning-of-line))
  (newline)
  (forward-line -1)
  (indent-according-to-mode))
(global-set-key (kbd "C-S-o") 'make-newline-above)

;; Multiple cursor
(use-package multiple-cursors
  :ensure t
  :bind (("C-S-c C-S-c" . mc/edit-lines)
         ("C->"         . mc/mark-next-like-this)
         ("C-<"         . mc/mark-previous-like-this)
         ("C-c C-<"     . mc/mark-all-like-this)))
