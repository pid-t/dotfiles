;;; init-org-mode.el --- custom the org-mode
;;; Commentary:

(require 'ox-publish)
;;; code:
(setq org-publish-project-alist
      '(
        ("blog-notes"
         :base-directory "~/org/blog/org"
         :base-extension "org"
         :publishing-directory "~/org/blog/published/"
         :recursive t
         :publishing-function org-html-publish-to-html
         :headline-levels 4
         :section-numbers nil
         :auto-preamble t
         :auto-sitemap t       ; Generate sitemap.org automagically...
         :sitemap-filename "sitemap.org" ; ... call it sitemap.org (it's the default)...
         :sitemap-title "Sitemap"        ; ... with title 'Sitemap'.
         :author "dayigu"
         :email "dayigu at gmail dot com"
         :style    "<link rel=\"stylesheet\" type=\"text/css\" href=\"css/style.css\"/>"
         )
        ("blog-static"
         :base-directory "~/org/blog/"
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
         :publishing-directory "~/org/blog/published/"
         :recursive t
         :publishing-function org-publish-attachment
         )
        ("blog" :components ("blog-notes" "blog-static"))
        ))
(provide 'init-org-mode)

;;; init-org-mode.el ends here
