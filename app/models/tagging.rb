class Tagging < ActiveRecord::Base
  belongs_to :tag
  belongs_to :thing
end
