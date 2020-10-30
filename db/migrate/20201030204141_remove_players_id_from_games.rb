class RemovePlayersIdFromGames < ActiveRecord::Migration
  def change
    remove_column :games, :player_id, :integer
  end
end
