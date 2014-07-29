;Load_path
(add-to-list 'load-path' "~/.emacs.d/plugins")

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
(setq tags-file-name "E:/2.4/popocloud/TAGS")

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
(global-set-key (kbd  "C-x C-a") 'emacs-maximize)
(global-set-key (kbd  "C-x a") 'emacs-minimize)

;;支持emacs和外部程序的拷贝和粘贴
(setq x-select-enable-clipboard t)

;;在标题栏提示当前位置
(setq frame-title-format "Fiona@%b")
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
(fset 'yes-or-no-p 'y-n-p)

;;定位到我想要的文件件目录
;;定义变量
(defconst my-projects-path "d:/PopoServer/trunk/3.0/popocloud")

;;定义函数
(defun goto-my-projects-dir ()
  (interactive)
  (dired my-projects-path))
