class SaveNewGameSessions < ActiveRecord::Migration[5.2]
  def change
    create_table :game_sessions do |t|
      t.boolean :in_progress, null: false, default: true  #consider adding default: true
      t.boolean :complete, null: false, default: false  #consider adding default: false
      t.string :expiration_date  #better to set here, or with Javascript?

      t.timestamps
    end
  end
end
