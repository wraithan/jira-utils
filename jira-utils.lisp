;;;; jira-utils.lisp

(in-package #:jira-utils)

; loads username, password and jira-url from ~/.jirarc
(load (make-pathname :defaults (user-homedir-pathname) :name ".jirarc"))

(defun get-auth-code ()
  (xrpc:call jira-url
	     "jira1.login"
	     `(:string ,username :string ,password)))

(defun get-issues-with-description ()
  (xrpc:call jira-url
	     "jira1.getIssuesFromFilter"
	     `(:string ,(get-auth-code) :string "10000")))

(defun get-list-of-issues ()
  (iter (for element in (rest (get-issues-with-description)) by 'cddr)
	(collect (get-value "key" element))))

(defun get-value (key data &key (type 'string=))
  (getf (rest (assoc key data :test type)) :string))
