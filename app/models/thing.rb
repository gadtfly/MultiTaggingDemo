class Thing < ActiveRecord::Base
  has_many :taggings
  has_many :tags, through: :taggings

  def tag_list=(string)
    string.split(',').map(&:strip).reject(&:empty?).each do |tag_name|
      tag = Tag.find_or_create_by(name: tag_name)
      Tagging.find_or_create_by(thing: self, tag: tag)
    end
  end

  def tag_list
    self.tags.map(&:name).join(', ')
  end
end
