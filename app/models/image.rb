class Image < ActiveRecord::Base
  validates :link, presence: true 
end
