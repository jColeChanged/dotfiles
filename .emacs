;;  I'm expecting to be running emacs24
;;
;; The first thing we need to do to get good Python support is to get el-get
;; installed. From el-get install jedi.
;;
;; The next thing to do is to M-x package-install flycheck.
;; 
;; Then M-x package-install auto-pair.
;;
;; Next M-x package-install web-mode.
;;
;; Don't forget M-x package-install evil and zenburn-theme
;;

;; Set up package stuff
(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
(package-initialize)


;; Set up el-get stuff
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (let (el-get-master-branch)
      (goto-char (point-max))
      (eval-print-last-sexp))))
(el-get 'sync)


;; set up jedi
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

;; set up flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)

;; set up autopair
(require 'autopair)
(autopair-global-mode)

;; Set up web mode for basic html files
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

;; Use zenburn theme

;; Set up some graphical stuff
(load-theme `zenburn t)
(scroll-bar-mode -1)
(menu-bar-mode -1)
(tool-bar-mode -1)

;; Make sure I don't get RSI
(require 'evil)
(evil-mode 1)
