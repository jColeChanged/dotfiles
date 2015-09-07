;; Emacs for Python integration
;; git clone git://github.com/gabrielelanaro/emacs-for-python
(load-file "~/.emacs.d/emacs-for-python/epy-init.el")

;; Set up some graphical stuff
(scroll-bar-mode -1)
(menu-bar-mode -1)
(tool-bar-mode -1)


;; Set up package stuff
(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
(package-initialize)
(add-hook 'js-mode-hook 'js2-minor-mode)
(add-hook 'js2-mode-hook 'ac-js2-mode)


(require 'web-mode)
(setq web-mode-engines-alist
      '(("django" . "\\.html\\'")))

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

