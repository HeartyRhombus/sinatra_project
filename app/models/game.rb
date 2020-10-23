class Game < ActiveRecord::Base
    has_and_belongs_to_many :player
    # validates :title, :platform, prescense: true
end