JIRA-UTILS

To use this you'll need a .jirarc with the following format in your home directory:

(defvar username "xmlrpctester")
(defvar password "xmlrpctester")
(defvar jira-url "http://jira.atlassian.com/rpc/xmlrpc")


Currently the only exported function is:
(JIRA-UTILS:GET-LIST-OF-ISSUES)

Which returns the issue numbers for all of the current user's issues in a list.
