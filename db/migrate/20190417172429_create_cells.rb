class CreateCells < ActiveRecord::Migration[5.2]
  def change
    create_table :cells do |t|
      t.integer :game_session_id
      t.string :name  # "mage", "axe", "tree"
      t.string :type  # <== NOW called cellType - "unit", "item"
      t.boolean :on_map, null: false
      t.float :position_left
      t.float :position_top
      t.float :position_width
      t.float :position_height

      t.timestamps
    end
  end
end
