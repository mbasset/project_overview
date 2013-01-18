class ProjectOverviewController < ApplicationController
  unloadable

  def index
    respond_to do |format|
      format.html {
        scope = Project
        unless params[:closed]
          scope = scope.active
        end
        if params[:stale]
          @stale = true
        end
        if Setting.plugin_project_overview.has_key?(:exclude_projects)
          scope = scope.where("id NOT IN (?)", Setting.plugin_project_overview[:exclude_projects])
        end
        @projects = scope.visible.order('name DESC').all
      }
    end
  end
  
end
