class UserGuideJoin < ApplicationRecord
  belongs_to :editor, class_name: 'User'
  belongs_to :guide
end
