class RenameDescription < ActiveRecord::Migration[7.1]
  def change
    rename_column :projects, :descript, :description
  end
end
