class CreateProjects < ActiveRecord::Migration[7.0]
  def change

    create_table :projects do |t|
      t.string :project_domain
      t.text :description
      t.string :budget
      t.string :time_estimate
      t.timestamps
    end
  end
end
