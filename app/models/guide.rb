class Guide < ApplicationRecord
  has_many :chapters, dependent: :destroy
  has_many :user_guide_joins, dependent: :destroy
  has_many :editors, through: :user_guide_joins, class_name: 'User'

  scope :latest, -> { order('id DESC') }
end
