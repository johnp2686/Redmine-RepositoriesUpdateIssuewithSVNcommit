require 'redmine'
require_dependency 'issues_update'
require_dependency 'custom_field_change'

Redmine::Plugin.register :redmine_issueupdate do
  name 'Redmine repositories update issue with SVN commit'
  author 'John Paul'
  description 'Redmine repositories update Resolved By and Resolution Type custom fields when svn commit resolves an issue and Automatically update Resolved By field to the current user'
  version '1.0'

  requires_redmine :version_or_higher => '2.2.x'
end
