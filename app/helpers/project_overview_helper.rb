module ProjectOverviewHelper

  def project_full_title(project)
    b = []
    ancestors = (project.root? ? [] : project.ancestors.visible.all)
    if ancestors.any?
      root = ancestors.shift
      b << root.name
      if ancestors.size > 2
        ancestors = ancestors[-2, 2]
      end
      b += ancestors.collect {|p| p.name }
    end
    b << project.name
    b.join(" &raquo; ").html_safe
  end

  def project_overview_spent_time(project)
    TimeEntry.visible.sum(:hours, :include => :project, :conditions => project.project_condition(true))
  end

  def project_overview_estimated_time(project)
    estimated_hours = 0
    project.self_and_descendants.each do |p|
      estimated_hours += p.issues.inject(0) { |sum, i| !i.parent.nil? ? sum : sum + i.estimated_hours.to_i }
    end
    estimated_hours
  end

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