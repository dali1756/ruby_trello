class CreateProjects < ActiveRecord::Migration[7.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.text :descript
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
