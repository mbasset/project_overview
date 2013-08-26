require 'redmine'

Redmine::Plugin.register :project_overview do
	name 'Project Overview'
	author 'Matthew Basset'
	description 'Updates the project overview page to make it more useful for teams.'
	version '1.2.0'
	url 'https://github.com/mbasset/project_overview'
	author_url 'http://mbasset.info'

	menu :top_menu, :overview, { :controller => 'overview', :action => 'index' }, :before => :projects

	settings :default => {
		:stale_enable => true,
		:stale_num_days => 14,
		:exclude_projects => [],
		:inactive_team_num_days => 14,
		:project_order => "by_name",
		:activity_sum_days => 14,
		:velocity_warning_margin => 5
	}, :partial => 'overview/settings'
end

require 'settings_helper'
SettingsHelper.send :include, ProjectOverviewHelper