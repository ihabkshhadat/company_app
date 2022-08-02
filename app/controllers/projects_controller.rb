class ProjectsController < ApplicationController

  def index
    @projects = helpers.filter(params)
    respond_to do |format|
      format.html
      format.js
    end

  end

  def filter_user_by_company
    if  params[:company].present?
      @users = User.where(:company_id => params[:company]).order(:last_name)
    else
      @users = User.all.order(:last_name)
    end
  end


end
