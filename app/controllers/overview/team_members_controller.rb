class Overview::TeamMembersController < ApplicationController
  unloadable

  def show
    respond_to do |format|
      format.js {
        @team_member = User.find(params[:id])
        render :show
      }
    end    
  end

end
