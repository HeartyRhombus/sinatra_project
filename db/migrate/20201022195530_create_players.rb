class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.string :gamer_tag
      t.string :preferred_platform
    end
  end
end
