class AddTerrainArrayToAllTerrains < ActiveRecord::Migration[5.2]
  def change
    add_column :all_terrains, :img_src_array, :text, array:true, default: []
  end
end
