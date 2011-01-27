;;;; jira-utils.asd

(asdf:defsystem #:jira-utils
  :serial t
  :depends-on (#:cxml-rpc
               #:iterate)
  :components ((:file "package")
               (:file "jira-utils")))

