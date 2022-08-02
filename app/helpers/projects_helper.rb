module ProjectsHelper
  def filter params
    if params[:search].present?
      @projects = Project.where("project_domain like ? OR description like ?", "%#{params[:search]}%","%#{params[:search]}%")
      if params[:user].present?
        @projects = @projects.and(Project.where(user_id: params[:user]))
      end
    elsif params[:user].present?
      @projects = Project.where(user_id: params[:user])
    else
      @projects = Project.first(10)
    end
    @projects
  end


end
