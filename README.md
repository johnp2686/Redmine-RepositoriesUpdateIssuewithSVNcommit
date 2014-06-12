Redmine-RepositoriesUpdateIssuewithSVNcommit
============================================

Redmine repositories update Resolved By and Resolution Type custom fields when svn commit resolves an issue and Automatically update Resolved By field to the current user
And When user change issue status "Resolved and Reviewed by " automatically change the current user


Installation notes

Steps:
Download last version from https://github.com/johnp2686/Redmine-RepositoriesUpdateIssuewithSVNcommit.git
rake redmine:plugins:migrate RAILS_ENV=production
Restart you Redmine.
