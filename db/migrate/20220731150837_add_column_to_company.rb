class AddColumnToCompany < ActiveRecord::Migration[7.0]
  def change
    add_column :companies, :meta_data, :json
    add_column :companies, :working_days, :text
  end
end
