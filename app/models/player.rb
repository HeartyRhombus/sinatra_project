class Player < ActiveRecord::Base
    validates :name, :preferred_platform, presence: true
end