class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @user.update(user_params)
      redirect_to @user
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    redirect_to root_path, status: :see_other
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :phone_number, :user_type, :company_id)
  end

  def set_user
    @user = User.find_by(id: params[:id])

  end

end
