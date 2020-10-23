class Player < ActiveRecord::Base
    has_many :games
    has_secure_password
    # validates :name, :preferred_platform, presence: true
end