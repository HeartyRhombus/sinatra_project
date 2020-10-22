class Game < ActiveRecord::Base
    belongs_to :player
    # validates :title, :platform, prescense: true
end