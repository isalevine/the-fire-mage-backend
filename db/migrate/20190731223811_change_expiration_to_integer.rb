class ChangeExpirationToInteger < ActiveRecord::Migration[5.2]
  def change
    remove_column :game_sessions, :expiration_date
    add_column :game_sessions, :expiration, :integer
  end
end
