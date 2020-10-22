class Player < ActiveRecord::Base
    has_many :games
    validates :name, :preferred_platform, presence: true
end