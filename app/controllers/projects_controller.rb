class ProjectsController < ApplicationController

  def index
    @users = User.all.order(:last_name)

    if params[:user].present?
      @projects = Project.where(user_id: params[:user])
    else
      @projects = Project.all
    end
    respond_to  do |format|
      format.html
      format.json { render json: @projects.to_json, status: :ok }
    end
  end

  def filter_user_by_company
    if params[:company].present?
      @users = User.where(company_id:  params[:company].to_i).order(:last_name)
    else
      @users = User.all.order(:last_name)
    end
    @users
  end
end
