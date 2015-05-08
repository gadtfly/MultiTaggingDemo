class Tagging < ActiveRecord::Base
  belongs_to :tag
  belongs_to :thing

  after_destroy if: ->{ self.tag.taggings.empty? } { self.tag.destroy }
end
