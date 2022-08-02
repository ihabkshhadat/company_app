class AddColumnToProjects < ActiveRecord::Migration[7.0]
  def change
    add_column :projects, :external_id, :integer, index: true

  end
end
