require 'redmine'

Redmine::Plugin.register :project_overview do
  name 'Project Overview'
  author 'Matthew Basset'
  description 'Updates the project overview page to make it more useful for teams.'
  version '1.1.0'
  url 'https://github.com/mbasset/project_overview'
  author_url 'http://mbasset.info'

  menu :top_menu, :overview, { :controller => 'overview', :action => 'index' }, :before => :projects
  
  settings :default => {
    :stale_enable => true,
    :stale_num_days => 14,
    :exclude_projects => [],
    :inactive_team_num_days => 14
  }, :partial => 'overview/settings'
end

require 'settings_helper'
SettingsHelper.send :include, ProjectOverviewHelper