class CreateAllTerrains < ActiveRecord::Migration[5.2]
  def change
    create_table :all_terrains do |t|
      t.integer :game_session_id

      t.timestamps
    end
  end
end
