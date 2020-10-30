class Game < ActiveRecord::Base
    has_and_belongs_to_many :players
    belongs_to :creator, class_name: "Player"
    validates :title, :platform, presence: true
end