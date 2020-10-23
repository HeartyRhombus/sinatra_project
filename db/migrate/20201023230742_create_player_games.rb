class CreatePlayerGames < ActiveRecord::Migration
  def change
    create_join_table :players, :games
  end
end
