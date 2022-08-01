class CreateCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :companies do |t|
      t.string :business_name
      t.string :street_address
      t.string :phone_number
      t.string :city
      t.timestamps
    end
  end
end
