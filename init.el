(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line

(package-refresh-contents)

(package-install 'intero)
(add-hook 'haskell-mode-hook 'intero-mode)

(when (fboundp 'winner-mode)
  (winner-mode 1))

(defun yank-pop-forwards (arg)
      (interactive "p")
      (yank-pop (- arg)))

(global-set-key "\M-Y" 'yank-pop-forwards) ; M-Y (Meta-Shift-Y)

;;(elpy-enable)

(desktop-save-mode 1)

(yas-global-mode 1)

(ac-config-default)
;;(pdf-tools-install)


(eval-after-load 'flycheck
 '(add-hook 'flycheck-mode-hook #'flycheck-haskell-setup))




;;(require 'pdf-tools)

(add-hook 'comint-output-filter-functions 'comint-truncate-buffer)


 (setenv "PATH" (concat (getenv "PATH") ":/opt/local/bin"))
    (setq exec-path (append exec-path '("/opt/local/bin")))

 (setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
    (setq exec-path (append exec-path '("/usr/local/bin")))

(defun nuke-all-buffers ()
  (interactive)
  (mapcar 'kill-buffer (buffer-list))
  (delete-other-windows))

(global-set-key (kbd "C-x K") 'nuke-all-buffers)
(global-set-key (kbd "C-x C-b") 'ibuffer)

(global-set-key (kbd "C-c b") 'windmove-left)
(global-set-key (kbd "C-c f") 'windmove-right)
(global-set-key (kbd "C-c p") 'windmove-up)
(global-set-key (kbd "C-c n") 'windmove-down)


(set-default-font "Monospace-16")

(add-hook 'dired-mode-hook 'auto-revert-mode)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (deeper-blue)))
 '(ediff-split-window-function (quote split-window-horizontally))
 '(ediff-window-setup-function (quote ediff-setup-windows-plain))
 '(package-selected-packages
   (quote
    (intero ghc flycheck-haskell auto-complete transpose-frame restclient magit haskell-mode flymake-haskell-multi ensime elpy darkane-theme dante auto-package-update auctex)))
 '(tool-bar-mode nil))

(setq js-indent-level 2)
;;(setq ensime-startup-snapshot-notification nil)

;;(setq auto-package-update-interval 3)
;;(setq auto-package-update-delete-old-versions t)
;;(add-hook 'auto-package-update-before-hook
;;          (lambda () (message "I will update packages now")))

(add-hook 'prog-mode-hook 'linum-mode)
(setq linum-format "%d ")

(setq magit-auto-revert-mode 1)
(global-set-key (kbd "C-x g") 'magit-status)

;;(paradox-upgrade-packages)


(progn(require 'comint)
(define-key comint-mode-map (kbd "<up>") 'comint-previous-input)
(define-key comint-mode-map (kbd "<down>") 'comint-next-input))
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

(setq ring-bell-function 'ignore)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'erase-buffer 'disabled nil)

(autoload 'ghc-init "ghc" nil t)
(autoload 'ghc-debug "ghc" nil t)
(add-hook 'haskell-mode-hook (lambda () (ghc-init)))
