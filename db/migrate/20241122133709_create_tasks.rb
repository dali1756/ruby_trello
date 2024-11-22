class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks do |t|
      t.references :user, null: false, foreign_key: true
      t.references :lanes, null: false, foreign_key: true
      t.string :name
      t.integer :priority
      t.integer :level
      t.string :status
      t.datetime :end_data

      t.timestamps
    end
  end
end
