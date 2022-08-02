class ProjectsController < ApplicationController

  def index
    @projects = helpers.filter(params)
  end

  def filter_user_by_company
    @users = helpers.filter_user_by_company params[:company]
  end


end
