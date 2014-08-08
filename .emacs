;;Load_path
(add-to-list 'load-path' "~/.emacs.d/plugins")
(add-to-list 'load-path' "~/.emacs.d/elpa") 
;;(add-to-list 'exec-path  "d:/software/emacs/bin") 

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(show-paren-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Lucida Console" :foundry "outline" :slant normal :weight normal :height 143 :width normal)))))
;;======================    color setting        =====================
;; 指针颜色设置为白色
(set-cursor-color "purple")
;; 鼠标颜色设置为白色
(set-mouse-color "white")
;;
;; 设置背景颜色和字体颜色
;;(set-background-color "black")
;;(set-foreground-color "white")
(set-background-color "#C1FFC1")
(set-foreground-color "#102372")

;; 设置另外一些颜色：语法高亮显示的背景和主题，区域选择的背景和主题，二次选择的背景和选择
;;(set-face-foreground 'highlight "white")
;;(set-face-background 'highlight "blue")
(set-face-foreground 'region "green")
(set-face-background 'region "blue")
(set-face-foreground 'secondary-selection "skyblue")
(set-face-background 'secondary-selection "darkblue")

;;语法高亮
(global-font-lock-mode t) 

;;打开图片显示功能
(auto-image-file-mode t) 

;; 默认显示 80列就换行 
(setq default-fill-column 80) 

;;支持emacs和外部程序的粘贴
(setq x-select-enable-clipboard t)

;;显示行列号
(setq column-number-mode t)
(setq line-number-mode t)

;;在左边显示行号
(global-linum-mode 'linum-mode)
;; For Linux
;;(global-set-key (kbd "<C-mouse-4>") 'text-scale-increase)
;;(global-set-key (kbd "<C-mouse-5>") 'text-scale-decrease)

;; For Windows
(global-set-key (kbd "<C-wheel-up>") 'text-scale-increase)
(global-set-key (kbd "<C-wheel-down>") 'text-scale-decrease)
;; set tags

(setq tags-file-name "D:/PopoServer/trunk/3.0/popocloud/TAGS")
(setq tags-table-list '("D:/PopoServer/trunk/3.0/popocloud/TAGS""D:/PopoServer/trunk/PC/Tools/Python27/TAGS"))
;;(setq tags-file-name "D:/PopoServer/trunk/PC/Tools/Python27/TAGS")
;;显示时间
(display-time-mode 1) ;;启用时间显示设置，再minibuffer上面那个杠上

(put 'upcase-region 'disabled nil)

;; window maximize/minimize/normal  
;; windows interface  
(defun emacs-maximize ()  
  "Maximize emacs window in windows os"  
  (interactive)  
  (w32-send-sys-command 61488))        ; WM_SYSCOMMAND #xf030 maximize  
(defun emacs-minimize ()  
  "Minimize emacs window in windows os"  
  (interactive)  
  (w32-send-sys-command #xf020))    ; #xf020 minimize  
(defun emacs-normal ()  
  "Normal emacs window in windows os"  
  (interactive)  
  (w32-send-sys-command #xf120))    ; #xf120 normalimize  
  
;; (emacs-maximize)  
(global-set-key (kbd  "C-x c") 'emacs-maximize)
(global-set-key (kbd  "C-x a") 'emacs-minimize)

;;支持emacs和外部程序的拷贝和粘贴
(setq x-select-enable-clipboard t)

;;在标题栏提示当前位置
(setq frame-title-format "%b")
;;自动补全
(setq hippie-expand-try-functions-list
      '(
        try-expand-dabbrev
        try-expand-dabbrev-visible
        try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill
        try-expand-list
        try-expand-list-all-buffers
        try-expand-line
        try-expand-line-all-buffers
        try-complete-file-name-partially
        try-complete-file-name
        try-expand-whole-kill
        )
)
;;跳转到.emacs配置文件快捷键
;;(set-register ?e '(file "c:"))
;;设置所有的问答采用y/n方式
(fset 'yes-or-no-p 'y-or-n-p)

;;定位到我想要的文件件目录 ;;定义变量
(defconst my-projects-path "d:/PopoServer/trunk/3.0/popocloud")
(defconst my-script-path "d:/script")

;;定义函数
(defun goto30 ()
  (interactive)
  (dired my-projects-path))
(defun gotoscript ()
  (interactive)
  (dired my-script-path))

;;自动插入匹配的括号
(setq skeleton-pair t)
(global-set-key (kbd "(") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "[") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "{") 'skeleton-pair-insert-maybe)
;;清理shell 模式的屏幕
(defun eshell/cls()   
  "to clear the eshell buffer."   
  (interactive)   
  (let ((inhibit-read-only t))   
    (erase-buffer)))   

;;检查拼写错误
(defun turn-spell-checking-on ()
  "Turn flyspell-mode on."
  (flyspell-mode 1)
  )

(add-hook 'text-mode-hook 'turn-spell-checking-on)

;;cua model
(cua-mode 1)

;;【Enter ↵】 Describe the package under cursor. (describe-package)
;;【i】 mark for installation. (package-menu-mark-install)
;;【u】 unmark. (package-menu-mark-unmark)
;;【d】 mark for deletion (removal of a installed package). (package-menu-mark-delete)
;;【x】 for “execute” (start install/uninstall of marked items). (package-menu-execute)
;;【r】 refresh the list from server. (package-menu-refresh)
;;just call to list-packages
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  )

;; check OS type
(defun current-system ()
(interactive)
(cond
 ((string-equal system-type "windows-nt") ; Microsoft Windows
  (progn
    (message "Microsoft Windows"))
  )
 ((string-equal system-type "darwin")   ; Mac OS X
  (progn
    (message "Mac OS X")
    )
  )
 ((string-equal system-type "gnu/linux") ; linux
  (progn
    (message "Linux") )
  )
 ))
;; learn elisp http://ergoemacs.org/emacs/elisp.html


;;emacs的自动备份功能
(setq
  backup-by-copying t ; 自动备份
  backup-directory-alist
  '(("." . "D:/ebackup")) ; 自动备份在目录"~/.saves"下
  delete-old-versions t ; 自动删除旧的备份文件
  kept-new-versions 6 ; 保留最近的6个备份文件
  kept-old-versions 2 ; 保留最早的2个备份文件
  version-control t) ; 多次备份


;;复制一个单词
(defun copy-word (&optional arg)
 "Copy words at point"
 (interactive "P")
 (let ((beg (progn (if (looking-back "[a-zA-Z0-9]" 1) (backward-word 1)) (point))) 
	(end (progn (forward-word arg) (point))))
 (copy-region-as-kill beg end))
)

(global-set-key (kbd  "C-c w") 'copy-word) 

;;复制一行
(defun copy-line (&optional arg)
 "Save current line into Kill-Ring without mark the line"
 (interactive "P")
 (let ((beg (line-beginning-position)) 
	(end (line-end-position arg)))
 (copy-region-as-kill beg end)))

(global-set-key (kbd  "C-c l") 'copy-line)  


;;切换窗口
(global-set-key [(control tab)] 'other-window)

;;自动换行
(add-hook 'lisp-mode-hook '(lambda ()
      (local-set-key (kbd "RET") 'newline-and-indent))) 

;;光标显示为一竖线
;;(setq-default cursor-type 'bar)

;;slime,这个需要安装slime插件
(require 'slime)
(slime-setup)
(require 'slime-autoloads)


;;自动补齐配置,会弹出一个列表框让你选择
(require 'auto-complete)
(require 'auto-complete-config)
(global-auto-complete-mode t)
(setq-default ac-sources '(ac-source-words-in-same-mode-buffers))
(add-hook 'emacs-lisp-mode-hook (lambda () (add-to-list 'ac-sources 'ac-source-symbols)))
(add-hook 'auto-complete-mode-hook (lambda () (add-to-list 'ac-sources 'ac-source-filename)))
(set-face-background 'ac-candidate-face "lightgray")
(set-face-underline 'ac-candidate-face "darkgray")
(set-face-background 'ac-selection-face "steelblue") ;;; 设置比上面截图中更好看的背景颜色
(define-key ac-completing-map "\M-n" 'ac-next)  ;;; 列表中通过按M-n来向下移动
(define-key ac-completing-map "\M-p" 'ac-previous)
(setq ac-auto-start 2)
(setq ac-dwim t)
(define-key ac-mode-map (kbd "M-TAB") 'auto-complete)
