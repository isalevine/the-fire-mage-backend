class CreateTerrains < ActiveRecord::Migration[5.2]
  def change
    create_table :terrains do |t|
      t.integer :game_session_id
      t.integer :grid_x
      t.integer :grid_y
      t.string :img_src

      t.timestamps
    end
  end
end
