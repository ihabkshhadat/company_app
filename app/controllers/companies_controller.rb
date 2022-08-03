class CompaniesController < ApplicationController
  before_action get_object, only: i[show, edit, update, destroy]

  def index
    @companies = Company.all
  end

  def show
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)

    if @company.save
      redirect_to @company
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update

    if @company.update(company_params)
      redirect_to @company
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @company.destroy
    redirect_to root_path, status: :see_other
  end

  private

  def company_params
    params.require(:company).permit(:business_name, :street_address, :phone_number, :city, working_days: [], meta_data: [:branch, :created_date])
  end

  def get_object
    @company = Company.find(params[:id])

  end

end

