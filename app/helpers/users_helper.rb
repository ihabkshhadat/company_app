module UsersHelper
  def filter_user_by_company company_id
    if  company_id.present?
      @users = User.where(:company_id => company_id).order(:last_name)
    else
      @users = User.all.order(:last_name)
    end
    @users
  end
end
