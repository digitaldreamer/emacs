;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq kill-whole-line t)                   ;;; Killing line also deletes \n
;(setq next-line-add-newlines nil)          ;;; Down arrow won't add \n at end
;(setq require-final-newline t)             ;;; Put \n at end of last line
(setq make-backup-files nil)               ;;; Don't make backup files
;(setq scroll-step 1)                       ;;; Scroll 1 line at a time
(setq line-number-mode t)                  ;;; Put line number in display
(setq column-number-mode t)                ;;; Put column number in display
(setq system-name "main")                  ;;; My login name
(setq default-major-mode 'text-mode)       ;;; New buffers are text mode
;(setq fill-column 80)                      ;;; Text lines limit to 80 chars
;(add-hook 'text-mode-hook 'turn-on-auto-fill); Line limit on in text mode
(mouse-wheel-mode t) ;mouse scroll
;(setq auto-fill-mode 1) ;wrap text
(prefer-coding-system 'utf-8) ;use unicode
;(global-hl-line-mode 1) ; highlight current line
(transient-mark-mode t) ; highlight region
(setq mouse-drag-copy-region nil) ; highlighting regions with the mouse does not copy text

;; comment blocks
(global-set-key [(ctrl shift m)] 'comment-region)
(global-set-key [(ctrl shift n)] 'uncomment-region)


;; cycle buffers
(autoload 'cycle-buffer "~/emacs/cycle-buffer" "Cycle forward." t)
(autoload 'cycle-buffer-backward "~/emacs/cycle-buffer" "Cycle backward." t)
(autoload 'cycle-buffer-permissive "~/emacs/cycle-buffer" "Cycle forward allowing *buffers*." t)
(autoload 'cycle-buffer-backward-permissive "~/emacs/cycle-buffer" "Cycle backward allowing *buffers*." t)
(autoload 'cycle-buffer-toggle-interesting "~/emacs/cycle-buffer" "Toggle if this buffer will be considered." t)
(global-set-key [(ctrl shift right)] 'cycle-buffer)
(global-set-key [(ctrl shift left)] 'cycle-buffer-backward)
(global-set-key [(ctrl shift up)] 'cycle-buffer-permissive)
(global-set-key [(ctrl shift down)] 'cycle-buffer-backward-permissive)
;;(global-set-key [(ctrl shift right)] 'cycle-buffer-toggle-interesting)
;;(global-set-key [(ctrl shift left)] 'cycle-buffer-toggle-interesting)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'load-path "~/emacs")

;; line numbers
;; M-x linum    to toggle
(require 'linum)
(setq linum-format "%d ")

;; color-theme
(add-to-list 'load-path "~/emacs/color-theme-6.6.0")

(require 'color-theme)
(color-theme-initialize)
;(color-theme-dark-blue2)
(color-theme-charcoal-black)

;; change initial size
;(add-to-list 'default-frame-alist '(height . 60))
;(add-to-list 'default-frame-alist '(width . 225))
;(add-to-list 'default-frame-alist '(top . 100))
;(add-to-list 'default-frame-alist '(left . 200))

;; ido (for completion in opening and switching buffers)
(require 'ido)
(ido-mode t)

;(require 'fuzzy-format)
;(setq fuzzy-format-default-indent-tabs-mode nil)
;(global-fuzzy-format-mode t)

;; tab
;(global-set-key (kbd "TAB") 'self-insert-command) ; force insert one tab
;(global-set-key (kbd "TAB") 'tab-to-tab-stop) ; tabs are relative to the line above
;(global-set-key "\C-m" 'newline-and-indent)
(setq standard-indent 1)
(setq-default indent-tabs-mode nil) ;Use spaces for tabs only!
(setq default-tab-width 4) ; tab width

; fix tabing for python
(defun my-pystuff ()
  (setq tab-width 4
        py-indent-offset 4
        indent-tabs-mode nil
        py-smart-indentation nil))

(add-hook 'python-mode-hook 'my-pystuff)

; toggle home between first non-whitespace and beginning of line
(defun smart-beginning-of-line ()
  (interactive)
  (let ((oldpos (point)))
    (back-to-indentation)
    (and (= oldpos (point))
         (beginning-of-line))))

(global-set-key [home] 'smart-beginning-of-line)


;; javascript mode
(autoload 'javascript-mode "javascript" nil t)
(add-to-list 'auto-mode-alist '("\\.js\\'" . javascript-mode))

;; close all buffers
(defun kill-all-buffers ()
  (interactive)
  (mapc 'kill-buffer (buffer-list)))

;(global-set-key "\C-cx" 'kill-all-buffers)
