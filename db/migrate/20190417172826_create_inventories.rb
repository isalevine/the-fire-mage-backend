class CreateInventories < ActiveRecord::Migration[5.2]
  def change
    create_table :inventories do |t|
      t.integer :cell_id
      t.boolean :axe, null: false  # consider adding default: false

      t.timestamps
    end
  end
end
