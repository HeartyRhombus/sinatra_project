class Game < ActiveRecord::Base
    validates :title, :platform, prescense: true
end