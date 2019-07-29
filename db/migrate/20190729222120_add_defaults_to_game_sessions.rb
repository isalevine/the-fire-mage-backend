class AddDefaultsToGameSessions < ActiveRecord::Migration[5.2]
  def change
    drop_table :game_sessions

    create_table :game_sessions do |t|
      t.boolean :in_progress, default: true, null: false  #consider adding default: true
      t.boolean :complete, default: false, null: false  #consider adding default: false
      t.string :expiration_date  #better to set here, or with Javascript?

      t.timestamps
    end
  end
end
