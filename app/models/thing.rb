class Thing < ActiveRecord::Base
  has_many :taggings
  has_many :tags, through: :taggings

  scope :tagged_with, ->(tag_name){ joins(:tags).where(tags: {name: tag_name}) }
  scope :tagged_with_any, ->(tag_names){ joins(:tags).where(tags: {name: tag_names}) }
  scope :tagged_with_all, ->(tag_names){ tagged_with_any(tag_names).group('things.id').having('count(distinct tags.id) = ?', tag_names.size) }

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
