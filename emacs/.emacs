;; locale coding 
(setq locale-coding-system'utf-8) 
(prefer-coding-system'utf-8) 
(set-keyboard-coding-system'utf-8) 
(set-terminal-coding-system'utf-8) 
(set-selection-coding-system'utf-8) 
(set-clipboard-coding-system 'ctext) 
(set-buffer-file-coding-system 'utf-8) 

(global-set-key  (kbd "C-x l") 'windmove-left)
(global-set-key  (kbd "C-x r") 'windmove-right)
(global-set-key  (kbd "C-x p") 'windmove-up)
(global-set-key  (kbd "C-x d") 'windmove-down)

(add-hook 'c-mode-common-hook 'vespa-c-mode-hook)

;;table ==> 4
(setq default-indent-tabs-mode nil)
(setq default-tab-width 4)
(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)  
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(add-hook 'eshell-mode-hook 'ansi-color-for-comint-mode-on)

(setq c-basic-offset 4)

(setq make-backup-files nil)

;;c++ related
(add-hook 'c++-mode-hook
      '(lambda ( )
         (c-toggle-hungry-state)))
(add-hook 'c++-mode-hook
      '(lambda ( )
         (flyspell-prog-mode)))

(add-hook 'c++-mode-hook
      '(lambda ( )
         (c-set-style "vespa")))

(setq auto-mode-alist
     (cons '("\\.h\\'" . c++-mode) auto-mode-alist))

(add-to-list 'auto-mode-alist
'("\\..pp\\'" . c++-mode))

(add-to-list 'auto-mode-alist
'("\\.ll\\'" . c++-mode))

(add-to-list 'auto-mode-alist
'("\\.yy\\'" . c++-mode))

(add-to-list 'auto-mode-alist
'("\\.proto\\'" . java-mode))

;;c-mode related
(add-hook 'c-mode-hook
      '(lambda ( )
         (c-toggle-hungry-state)))
(add-hook 'c-mode-hook
      '(lambda ( )
         (flyspell-prog-mode)))


;;customized key bindings following

;;; uncomment this line to disable loading of "default.el" at startup
;; (setq inhibit-default-init t)

;; turn on font-lock mode
(when (fboundp 'global-font-lock-mode)
  (global-font-lock-mode t))

;; enable visual feedback on selections
;(setq transient-mark-mode t)

;; default to better frame titles
(setq frame-title-format
      (concat  "%b - emacs@" (system-name)))

;; default to unified diffs
(setq diff-switches "-u")

;; always end a file with a newline
;(setq require-final-newline 'query)


;;set colors
(set-foreground-color "grey")
(set-background-color "black")
(set-cursor-color "grey")
(set-mouse-color "gold1")

; (set-scroll-bar-mode nil)

;;set line number
(setq column-number-mode t)
(setq line-number-mode t)

;;parentheses settings
(show-paren-mode t)
(setq show-paren-style 'parentheses)

;;eshell settings
(defun open-eshell-other-buffer()
  "Open eshell in other buffer"
  (interactive)
  (split-window-vertically)
  (eshell))

(global-set-key [f5] 'refresh-buffer)
(global-set-key [f6] 'my-compile)
(global-set-key [f7] 'eshell)
(global-set-key [f8] 'open-eshell-other-buffer)
(global-set-key [f9] 'add-case-to-header-file)



;; Enable EDE (Project Management) features
(global-ede-mode 1)


(menu-bar-mode)
(setq backup-by-copying-when-linked t)
(load "python") ;; fix python-mode problems
(setq grep-command "grep --exclude=\"*.svn*\" -nH -e ")

(require 'ansi-color)
(add-hook 'compilation-filter-hook
          '(lambda ()
             (let ((min (point-min-marker))
                   (max (point-max-marker)))
               (ansi-color-apply-on-region min max))))

(fset 'add-case-to-header-file
   "\C-s::test\C-m\C-[b\C-[d\C-_\C-xt\C-[<\C-sSUITE_END\C-m\C-[OA\C-e\C-m\C-iCPPUNIT_TEST(\C-y);\C-sprivate\C-m\C-[OA\C-e\C-m\C-ivoid \C-y();\C-x\C-s\C-xt")

(defun refresh-buffer()
  "revert buffer without comfirmation"
  (interactive) (revert-buffer t t)
)
(put 'erase-buffer 'disabled nil)
