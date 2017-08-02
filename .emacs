;;; Emacs user-defined configurations

; 日本語する
(set-language-environment 'Japanese)
(prefer-coding-system 'utf-8)

;; MELPA: Package control subsystem
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)

;; Helm initialize
(require 'helm-config)
(helm-mode 1)
(add-to-list 'helm-completing-read-handlers-alist '(find-file . nil))

; Helm minibuffer configurations
(define-key helm-map (kbd "C-h") 'delete-backward-char)
(define-key helm-find-files-map (kbd "C-h") 'delete-backward-char)
(define-key helm-find-files-map (kbd "TAB") 'helm-execute-persistent-action)
(define-key helm-read-file-map (kbd "TAB") 'helm-execute-persistent-action)

(defvar helm-source-emacs-commands
  (helm-build-sync-source "Emacs commands"
    :candidates (lambda ()
                  (let ((cmds))
                    (mapatoms
                     (lambda (elt) (when (commandp elt) (push elt cmds))))
                    cmds))
    :coerce #'intern-soft
    :action #'command-execute)
  "A simple helm source for Emacs commands.")

(defvar helm-source-emacs-commands-history
  (helm-build-sync-source "Emacs commands history"
    :candidates (lambda ()
                  (let ((cmds))
                    (dolist (elem extended-command-history)
                      (push (intern elem) cmds))
                    cmds))
    :coerce #'intern-soft
    :action #'command-execute)
  "Emacs commands history")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(helm-mini-default-sources
   (quote
    (helm-source-buffers-list helm-source-recentf helm-source-files-in-current-dir helm-source-emacs-commands-history helm-source-emacs-commands)))
 '(package-selected-packages
   (quote
    (multiple-cursors http centered-cursor-mode yascroll hlinum volatile-highlights anzu php-mode web-mode helm popup-kill-ring popup-complete auto-complete auto-save-buffers-enhanced flatland-black-theme flatland-theme monokai-theme))))

(global-set-key (kbd "M-x") #'helm-M-x)
(global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
(global-set-key (kbd "C-x C-f") #'helm-find-files)

;; Visual environments
; Theme
(load-theme 'flatland t)

; Font
(set-face-attribute 'default nil :family "BDF UM+ OUTLINE" :height 100)
(add-to-list 'default-frame-alist '(height . 48))
(add-to-list 'default-frame-alist '(width . 100))

; Transparency
(defun set-alpha (alpha-num)
  (interactive "nAlpha: ")
  (set-frame-parameter nil 'alpha (cons alpha-num '(85))))

; Under window system
(cond (window-system
					; Scrollbar
       (scroll-bar-mode -1)
       (global-yascroll-bar-mode 1)
					; Toolbar
       (tool-bar-mode -1)
       ))

; Linbar
(global-linum-mode 1)
(hlinum-activate)
; Centered scroll
(require 'centered-cursor-mode)
(global-centered-cursor-mode t)
; Cursor
(add-to-list 'default-frame-alist '(cursor-type . '(bar . 3)))
; Find
(global-anzu-mode 1)
; Undo hilightter
(volatile-highlights-mode 1)

;; Console I/O bindings
; C-h is backspace
(keyboard-translate ?\C-h ?\C-?)
; M-y is Visual kill-ring browser
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
; C-; is Mini-Helm
(global-set-key  (kbd "C-;") 'helm-mini)
; C-P is M-x
(global-set-key  (kbd "C-S-p") 'helm-M-x)
; C-z is Undo
(define-key global-map (kbd "C-z") 'undo)
; ... also C-t is suspend instead of C-z.
; but No sense in Win32 environment.
; (define-key global-map (kbd "C-t") 'suspend-emacs)

; Window move
(global-set-key (kbd "C-c <left>")  'windmove-left)
(global-set-key (kbd "C-c <down>")  'windmove-down)
(global-set-key (kbd "C-c <up>")    'windmove-up)
(global-set-key (kbd "C-c <right>") 'windmove-right)

; multiple-cursors
(global-set-key (kbd "C-M-<down>") 'mc/mark-next-like-this)
(global-set-key (kbd "C-M-<up>") 'mc/mark-previous-like-this)

; Disable fucking annoying audible bell
(setq ring-bell-function 'ignore)

; Move-line (M-N or M-P)
(defun move-line (arg)
  (let ((col (current-column)))
    (save-excursion
      (forward-line)
      (transpose-lines arg))
    (when (= arg 1)
      (forward-line))
    (move-to-column col)))

(global-set-key (kbd "M-N") #'(lambda ()
				(interactive)
				(move-line 1)))
(global-set-key (kbd "M-P") #'(lambda ()
				(interactive)
				(move-line -1)))

;; Configurations
; place of backup files
(setq backup-directory-alist
      (cons (cons ".*" (expand-file-name "~/.emacs.d/backups"))
	    backup-directory-alist))
(setq auto-save-file-name-transforms
      `((".*", (expand-file-name "~/.emacs.d/backups/") t)))

;; Auto-save when idle
(require 'auto-save-buffers-enhanced)
(setq auto-save-buffers-enhanced-interval 5) ; wait [s]
(setq auto-save-buffers-enhanced-quiet-save-p t) ; suppress minibuffer messages
(auto-save-buffers-enhanced t)

; ask when quiting emacs
(setq confirm-kill-emacs 'y-or-n-p)

;; Extentions
; (Non-MELPA Libraries)
(add-to-list 'load-path "~/.emacs.d/elib")

;; Change working directory
(cd "~/")

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
