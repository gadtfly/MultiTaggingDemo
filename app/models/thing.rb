class Thing < ActiveRecord::Base
  has_many :taggings
  has_many :tags, through: :taggings

  def tag_list=(string)
    taggings = string.split(',').map(&:strip).reject(&:empty?).map do |tag_name|
      tag = Tag.find_or_create_by(name: tag_name)
      Tagging.find_or_create_by(thing: self, tag: tag)
    end
    self.taggings.where.not(id: taggings.map(&:id)).destroy_all
  end

  def tag_list
    self.tags.map(&:name).join(', ')
  end
end
