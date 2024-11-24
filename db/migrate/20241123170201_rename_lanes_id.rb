class RenameLanesId < ActiveRecord::Migration[7.1]
  def change
    rename_column :tasks, :lanes_id, :lane_id
  end
end
