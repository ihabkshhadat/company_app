class ProjectsController < ApplicationController

  def index
    if params[:search]
      puts params[:company]
      @projects = Project.where("project_domain like ?","%#{params[:search]}%").or(Project.where("description like ?","%#{params[:search]}%"))
    else
      @projects = Project.all
    end
  end


end
