;;;; jira-utils.lisp

(in-package #:jira-utils)

; loads username, password and jira-url from ~/.jirarc
(load (make-pathname :defaults (user-homedir-pathname) :name ".jirarc"))

(defun get-auth-code ()
  (xrpc:call jira-url
	     "jira1.login"
	     `(:string ,username :string ,password)))

(defun get-issues-with-description ()
  (let ((auth-code (get-auth-code)))
    (xrpc:call jira-url
	       "jira1.getIssuesFromFilter"
	       `(:string ,auth-code :string "10000"))))

(defun get-list-of-issues ()
  (iter (for element in (get-issues-with-description))
	(for n from 0)
	(when (oddp n)
	    (collect (nth 2 (nth 3 element)) into retval))
	(finally (return retval))))


