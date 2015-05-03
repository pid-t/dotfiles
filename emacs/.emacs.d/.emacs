(require 'package)
  (push '("marmalade" . "http://marmalade-repo.org/packages/")
        package-archives )
  (push '("melpa" . "http://melpa.milkbox.net/packages/")
        package-archives)

(setq load-path (cons (expand-file-name "~/.emacs.d") load-path))

;; font settings
(defun qiang-font-existsp (font)
	(if (null (x-list-fonts font))
		nil t))

(defun qiang-make-font-string (font-name font-size)
	(if (and (stringp font-size)
		(equal ":" (string (elt font-size 0))))
		(format "%s%s" font-name font-size)
	(format "%s %s" font-name font-size)))

(defun qiang-set-font (english-fonts
					   english-font-size
					   chinese-fonts
					   &optional chinese-font-size)
  "english-font-size could be set to \":pixelsize=18\" or a integer.
If set/leave chinese-font-size to nil, it will follow english-font-size"
  (require 'cl)						 ; for find if
  (let ((en-font (qiang-make-font-string
				  (find-if #'qiang-font-existsp english-fonts)
				  english-font-size))
		(zh-font (font-spec :family (find-if #'qiang-font-existsp chinese-fonts)
							:size chinese-font-size)))
 
	;; Set the default English font
	;;
	;; The following 2 method cannot make the font settig work in new frames.
	;; (set-default-font "Consolas:pixelsize=18")
	;; (add-to-list 'default-frame-alist '(font . "Consolas:pixelsize=18"))
	;; We have to use set-face-attribute
	(message "Set English Font to %s" en-font)
	(set-face-attribute
	 'default nil :font en-font)
 
	;; Set Chinese font
	;; Do not use 'unicode charset, it will cause the english font setting invalid
	(message "Set Chinese Font to %s" zh-font)
	(dolist (charset '(kana han symbol cjk-misc bopomofo))
	  (set-fontset-font (frame-parameter nil 'font)
						charset
						zh-font))))
(qiang-set-font '("Consolas" "Monaco" "DejaVu Sans Mono" "Monospace" "Courier New") ":pixelsize=15"
	'("Microsoft Yahei" "文泉驿等宽微米黑" "黑体" "新宋体" "宋体"))

;; line numbers
(setq linum-format "%3d|")
(global-linum-mode 1)

;; themes
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'wombat)
(setq molokai-theme-kit t)
;; evil
(add-to-list 'load-path "~/.emacs.d/evil")
(require 'evil)
(evil-mode 1)

;; emmet
(add-to-list 'load-path "~/.emacs.d/emmet-mode")
(require 'emmet-mode)
(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.

;; indent
(add-to-list 'load-path "~/.emacs.d/indent-guide")
(require 'indent-guide)
(indent-guide-global-mode)
(setq indent-guide-recursive t)

;; neotree
(add-to-list 'load-path "~/.emacs.d/neotree")
(require 'neotree)
(global-set-key [f3] 'neotree-toggle)
(setq projectile-switch-project-action 'neotree-projectile-action)

;; golang
;(add-to-list 'load-path "~/.emacs.d/go-mode-load")
;(require 'go-mode-load)
(add-to-list 'load-path "~/.emacs.d/go-mode")
(require 'go-mode-autoloads)
(add-hook 'before-save-hook #'gofmt-before-save)

(add-to-list 'load-path "~/.emacs.d/popup")
(add-to-list 'load-path "~/.emacs.d/auto-complete")
(require 'auto-complete-config)
(ac-config-default)

(add-to-list 'load-path "~/.emacs.d/go-autocomplete")
(require 'go-autocomplete)
