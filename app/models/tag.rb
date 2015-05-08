class Tag < ActiveRecord::Base
  has_many :taggings
  has_many :things, through: :tags
end
