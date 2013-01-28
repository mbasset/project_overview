module ProjectOverviewHelper
  
  def project_overview_tabs
    [ {:name => 'projects', :partial => 'project_overview/projects', :label => :label_po_projects},
      {:name => 'team', :partial => 'project_overview/team', :label => :label_po_team}
    ]
  end
  
  def project_overview_settings_tabs
    [ {:name => 'project', :partial => 'project_overview/settings_project', :label => :label_po_settings_project},
      {:name => 'team', :partial => 'project_overview/settings_team', :label => :label_po_settings_team}
    ]
  end
  
  def last_user_event(user)
    Redmine::Activity::Fetcher.new(User.current, :author => user).events(nil, nil, :limit => 1).first
  end
end