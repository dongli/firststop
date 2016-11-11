class Chapter < ApplicationRecord
  has_many :user_chapter_joins, dependent: :destroy
  has_many :authors, through: :user_chapter_joins, class_name: 'User'
  belongs_to :guide
end
