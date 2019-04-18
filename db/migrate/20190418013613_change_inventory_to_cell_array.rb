class ChangeInventoryToCellArray < ActiveRecord::Migration[5.2]
  def change
    drop_table :inventories
    add_column :cells, :inventory, :string, array: true, default: []
  end
end
