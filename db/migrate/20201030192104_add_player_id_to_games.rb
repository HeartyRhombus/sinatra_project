class AddPlayerIdToGames < ActiveRecord::Migration
  def change
    add_column :games, :player_id, :integer
  end
end
