
;----------------------;
;;; Repos & Packages ;;;
;----------------------;

; ELPA repos
(add-to-list 'load-path "~/.emacs.d")
(load "package")
(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

; add el-get
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (let (el-get-master-branch)
      (goto-char (point-max))
      (eval-print-last-sexp))))
(el-get 'sync)


;--------------------;
;;;  Emacs Shell   ;;;
;--------------------;

;; ido 
(require 'ido)
(ido-mode t)


;----------------------;
;;;      Editor      ;;;
;----------------------;

; Emacs starts a new session every time you open it. 
; Remember your buffers(files) after restart. 
(require 'desktop)
  (desktop-save-mode 1)
  (defun my-desktop-save ()
    (interactive)
    ;; Don't call desktop-save-in-desktop-dir, as it prints a message.
    (if (eq (desktop-owner) (emacs-pid))
        (desktop-save desktop-dirname)))
  (add-hook 'auto-save-hook 'my-desktop-save)

; By default Emacs starts in a minimized window.
; Start emacs in a full-screen mode
(defun toggle-fullscreen ()
  (interactive)
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
	    		 '(2 "_NET_WM_STATE_MAXIMIZED_VERT" 0))
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
	    		 '(2 "_NET_WM_STATE_MAXIMIZED_HORZ" 0))
)
(toggle-fullscreen)

 ; Turn beep off
(setq visible-bell nil)
                                                
(cua-mode)
(setq initial-scratch-message "")

(require 'auto-complete)
; auto-complete extra settings
(setq
 ac-auto-start 2
 ac-override-local-map nil
 ac-use-menu-map t
 ac-candidate-limit 20)

(require 'autopair)

(require 'yasnippet)

(add-hook 'after-init-hook #'global-flycheck-mode)


;--------------------;
;;; User Interface ;;;
;--------------------;

; always use spaces, not tabs, when indenting
(setq indent-tabs-mode -1)
(setq tab-width 4)
; window modifications
(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)


;----------------------;
;;; Windows & Frames ;;;
;----------------------;

;; use shift to move around windows
;;(windmove-default-keybindings 'tab)

; don't show the startup screen
(setq inhibit-startup-screen t) 
; don't show the menu bar
(menu-bar-mode -1)             
; don't show the tool bar
(require 'tool-bar)
(tool-bar-mode -1)
; don't show the scroll bar
(scroll-bar-mode -1)

; fill-column indicator
(require 'fill-column-indicator)
(define-globalized-minor-mode global-fci-mode fci-mode (lambda () (fci-mode 1)))
(global-fci-mode t)
(setq fci-rule-width 1)
; number of characters until the fill column
(setq-default fill-column 80)

; specify the fringe width for windows -- this sets both the left and
; right fringes to 10
(require 'fringe)
(add-to-list 'default-frame-alist '(left-fringe . 10))
(add-to-list 'default-frame-alist '(right-fringe . 0))

; lines which are exactly as wide as the window (not counting the
; final newline character) are not continued. Instead, when point is
; at the end of the line, the cursor appears in the right fringe.
(setq overflow-newline-into-fringe t)

; each line of text gets one line on the screen (i.e., text will run
; off the left instead of wrapping around onto a new line)
(setq truncate-lines t)
; truncate lines even in partial-width windows
(setq truncate-partial-width-windows t)

; display line numbers to the right of the window
(global-linum-mode t)
; show the current line and column numbers in the stats bar as well
(line-number-mode t)
(column-number-mode t)


;------------;
;;; Cursor ;;;
;------------;

; highlight the current line
(require 'highlight-current-line)
(global-hl-line-mode t)
(setq highlight-current-line-globally t)
(setq highlight-current-line-high-faces -1)
(setq highlight-current-line-whole-line -1)

; don't blink the cursor
(blink-cursor-mode -1)

; make sure transient mark mode is enabled (it should be by default,
; but just in case)
(transient-mark-mode t)

; turn on mouse wheel support for scrolling
(require 'mwheel)
(mouse-wheel-mode t)


;-------------------------;
;;; Syntax Highlighting ;;;
;-------------------------;

; text decoration
(require 'font-lock)
(setq font-lock-maximum-decoration t)
(global-font-lock-mode t)
(global-hi-lock-mode -1)
(setq jit-lock-contextually t)
(setq jit-lock-stealth-verbose t)

; if there is size information associated with text, change the text
; size to reflect it
(size-indication-mode t)

; highlight parentheses when the cursor is next to them
(require 'paren)
(show-paren-mode t)


;-----------------;
;;; Color Theme ;;;
;-----------------;

(require 'color-theme-solarized)
(color-theme-solarized-dark)

; make sure the frames have the dark background mode by default
(setq default-frame-alist (quote ((frame-background-mode . dark))))

(custom-set-faces '(fringe ((t (:background "#073642")))))


;--------------------;
;;;     Tools      ;;;
;--------------------;
(require 'magit)
(global-set-key "\C-xg" 'magit-status)
;(global-set-key [f7] 'find-file-in-repository)


;--------------------;
;;;     Python     ;;;
;--------------------;
(require 'python-mode)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(setq py-electric-colon-active t)
(setq-default py-shell-name "ipython")
(setq-default py-which-bufname "IPython")

(require 'jedi)				
(setq jedi:server-command 
      '("python2" "/home/sivikt/.emacs.d/el-get/jedi/jediepcserver.py"))
(add-hook 'python-mode-hook 
          (lambda () 
             (jedi:setup)
             (jedi:ac-setup)
             (local-set-key "\C-cd" 'jedi:show-doc)
             (local-set-key (kbd "M-SPC") 'jedi:complete)
             (local-set-key (kbd "M-.") 'jedi:goto-definition)))

;; (require 'flymake)
;; (setq pylint "epylint")
;; (when (load "flymake" t)
;;   (defun flymake-pylint-init ()
;;     (let* ((temp-file (flymake-init-create-temp-buffer-copy
;;                        'flymake-create-temp-inplace))
;;            (local-file (file-relative-name
;;                         temp-file
;;                         (file-name-directory buffer-file-name))))
;;       (list (expand-file-name pylint "") (list local-file))))
;;   (add-to-list 'flymake-allowed-file-name-masks
;;                '("\\.py\\'" flymake-pylint-init)))

;; ;; Set as a minor mode for Python
;; (add-hook 'python-mode-hook '(lambda () (flymake-mode)))

;; (defun flymake-activate ()
;;   "Activates flymake when real buffer and you have write access"
;;   (if (and
;;        (buffer-file-name)
;;        (file-writable-p buffer-file-name))
;;       (progn
;;         (flymake-mode t)
;;         ;; this is necessary since there is no flymake-mode-hook...
;;         (local-set-key (kbd "C-c n") 'flymake-goto-next-error)
;;         (local-set-key (kbd "C-c p") 'flymake-goto-prev-error))))

;; ;; Configure to wait a bit longer after edits before starting
;; (setq-default flymake-no-changes-timeout '3)

;; ;; To avoid having to mouse hover for the error message, these functions make flymake error messages
;; ;; appear in the minibuffer
;; (defun show-fly-err-at-point ()
;;   "If the cursor is sitting on a flymake error, display the message in the minibuffer"
;;   (require 'cl)
;;   (interactive)
;;   (let ((line-no (line-number-at-pos)))
;;     (dolist (elem flymake-err-info)
;;       (if (eq (car elem) line-no)
;;       (let ((err (car (second elem))))
;;         (message "%s" (flymake-ler-text err)))))))

;; (add-hook 'post-command-hook 'show-fly-err-at-point)

;; (defun ca-flymake-show-help ()
;;   (when (get-char-property (point) 'flymake-overlay)
;;     (let ((help (get-char-property (point) 'help-echo)))
;;       (if help (message "%s" help)))))

;; (add-hook 'python-mode-hook 'flymake-activate)
;; (add-hook 'post-command-hook 'ca-flymake-show-help)

(add-hook 'python-mode-hook 'autopair-mode)
(add-hook 'python-mode-hook 'auto-complete-mode)
(add-hook 'python-mode-hook 'yas-minor-mode)
