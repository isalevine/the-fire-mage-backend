class ChangeCellTypeColumnName < ActiveRecord::Migration[5.2]
  def change
    remove_column :cells, :type
    add_column :cells, :cell_type, :string
  end
end
