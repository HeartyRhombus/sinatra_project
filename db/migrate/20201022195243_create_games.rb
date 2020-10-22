class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :title
      t.string :platform
      t.string :release_date
      t.string :rating
      t.text :description
    end
  end
end
