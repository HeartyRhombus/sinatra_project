class Player < ActiveRecord::Base
    has_and_belongs_to_many :games
    has_many :created_games, foreign_key: "creator_id", class_name: "Game"
    has_secure_password
    validates :email, uniqueness:true
    validates :email, :name, :password, presence: true
end