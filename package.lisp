;;;; package.lisp

(defpackage #:jira-utils
  (:use #:cl)
  (:export #:get-list-of-issues)
  (:shadowing-import-from #:iterate
			  #:iter
			  #:for
			  #:finally
			  #:collect))

