class Player < ActiveRecord::Base
    has_and_belongs_to_many :games
    has_secure_password
    # validates :name, :preferred_platform, presence: true
end