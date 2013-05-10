class OverviewController < ApplicationController
  unloadable

  helper :project_overview
  helper :custom_fields
  helper :queries
  include QueriesHelper

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

    scope = scope.visible

    @projects = case Setting.plugin_project_overview[:project_order]
    when "by_activity"
      scope.sort_by do |p|
        -1*Redmine::Activity::Fetcher.new(User.current, :project => p).events(Date.today - Setting.plugin_project_overview[:activity_sum_days].to_i.days, Date.today).count
      end
    else
      scope.order('name ASC')
    end
  end

  def team_index
    scope = User.status(User::STATUS_ACTIVE)
    @team_members = scope.order('firstname ASC, lastname ASC').all
  end

end
