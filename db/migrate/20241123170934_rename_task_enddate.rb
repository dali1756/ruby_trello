class RenameTaskEnddate < ActiveRecord::Migration[7.1]
  def change
    rename_column :tasks, :end_data, :end_date
  end
end
