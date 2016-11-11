class UserChapterJoin < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :chapter
end
