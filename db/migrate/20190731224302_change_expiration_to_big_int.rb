class ChangeExpirationToBigInt < ActiveRecord::Migration[5.2]
  def change
    remove_column :game_sessions, :expiration
    add_column :game_sessions, :expiration, :bigint
  end
end
