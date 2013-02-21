module ProjectOverviewHelper
  
  def project_overview_tabs
    [ {:name => 'projects', :partial => 'overview/projects', :label => :label_po_projects},
      {:name => 'team', :partial => 'overview/team', :label => :label_po_team}
    ]
  end
  
  def project_overview_settings_tabs
    [ {:name => 'project', :partial => 'overview/settings_project', :label => :label_po_settings_project},
      {:name => 'team', :partial => 'overview/settings_team', :label => :label_po_settings_team}
    ]
  end
  
end