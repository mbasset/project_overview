require 'redmine'

Redmine::Plugin.register :project_overview do
  name 'Project Overview'
  author 'Matthew Basset'
  description 'Updates the project overview page to make it more useful for teams.'
  version '1.0.0'
  url 'http://example.com/path/to/plugin'
  author_url 'http://mbasset.info'

  menu :top_menu, :overview, { :controller => 'project_overview', :action => 'index' }, :before => :projects
  
  settings :default => {
    :stale_num_days => 14,
    :exclude_projects => []
  }, :partial => 'project_overview/settings'
end