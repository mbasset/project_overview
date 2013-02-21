class OverviewController < ApplicationController
  unloadable
  
  helper :project_overview
  helper :custom_fields

  def index
    respond_to do |format|
      format.html {
        project_index
        team_index
      }
    end
  end

  private

  def project_index
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
    @projects = scope.visible.order('name ASC').all
  end

  def team_index
    scope = User.status(User::STATUS_ACTIVE)
    @team_members = scope.order('firstname ASC, lastname ASC').all
  end

end
