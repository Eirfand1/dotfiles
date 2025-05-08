(global-font-lock-mode 1)
(global-display-line-numbers-mode t)

(set-face-attribute 'default nil
  :family "Iosevka"
  :height 130) ;;

(setq-default tab-width 2)


(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))


(setq ring-bell-function 'ignore)

(require 'package)
(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
        ("gnu"   . "https://elpa.gnu.org/packages/")))
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'doom-themes)
  (package-install 'doom-themes))

(load-theme 'doom-1337 t) ;; atau tango-dark, tsdh-dark, dll

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(doom-1337 doom-vibrant))
 '(custom-safe-themes
	 '("e4a702e262c3e3501dfe25091621fe12cd63c7845221687e36a79e17cf3a67e0"
		 "93011fe35859772a6766df8a4be817add8bfe105246173206478a0706f88b33d"
		 "56044c5a9cc45b6ec45c0eb28df100d3f0a576f18eef33ff8ff5d32bac2d9700"
		 "da75eceab6bea9298e04ce5b4b07349f8c02da305734f7c0c8c6af7b5eaa9738"
		 "e978b5106d203ba61eda3242317feff219f257f6300bd9b952726faf4c5dee7b"
		 "aec7b55f2a13307a55517fdf08438863d694550565dee23181d2ebd973ebd6b8"
		 "4d5d11bfef87416d85673947e3ca3d3d5d985ad57b02a7bb2e32beaf785a100e"
		 "48042425e84cd92184837e01d0b4fe9f912d875c43021c3bcb7eeb51f1be5710"
		 "c1d5759fcb18b20fd95357dcd63ff90780283b14023422765d531330a3d3cec2"
		 "dccf4a8f1aaf5f24d2ab63af1aa75fd9d535c83377f8e26380162e888be0c6a9"
		 "452068f2985179294c73c5964c730a10e62164deed004a8ab68a5d778a2581da"
		 "b5fd9c7429d52190235f2383e47d340d7ff769f141cd8f9e7a4629a81abc6b19"
		 "014cb63097fc7dbda3edf53eb09802237961cbb4c9e9abd705f23b86511b0a69"
		 default))
 '(package-selected-packages
	 '(auto-complete company-go doom-themes exec-path-from-shell flymake-go
									 go-autocomplete lsp-ui)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


(unless (package-installed-p 'lsp-mode)
  (package-refresh-contents)
  (package-install 'lsp-mode))
(unless (package-installed-p 'go-mode)
  (package-install 'go-mode))
(unless (package-installed-p 'company)
  (package-install 'company))
(unless (package-installed-p 'company-go)
  (package-install 'company-go))
(unless (package-installed-p 'lsp-ui)
  (package-install 'lsp-ui))

;; Konfigurasi company mode untuk autocomplete
(require 'company)


(setq company-idle-delay 0.1)  ;; Menampilkan suggestion lebih cepat
(setq company-minimum-prefix-length 1)  ;; Mulai suggestion setelah 1 karakter
(add-hook 'after-init-hook 'global-company-mode)

;; LSP mode untuk intellisense
(require 'lsp-mode)
(setq lsp-enable-snippet t)
(setq lsp-prefer-flymake nil)
(setq lsp-completion-enable t)
(add-hook 'go-mode-hook #'lsp-deferred)

;; LSP UI untuk dokumentasi hover dan sebagainya
(require 'lsp-ui)
(setq lsp-ui-doc-enable t)
(setq lsp-ui-doc-position 'at-point)
(put 'upcase-region 'disabled nil)
