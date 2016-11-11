class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessor :login
  def self.find_for_database_authentication warden_conditions
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_hash).where(["lower(username) = :value OR lower(email) =  :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:username) || conditions.has_key?(:email)
      where(conditions.to_hash).first
    end
 end

  extend Enumerize
  enumerize :role, in: [:admin, :author, :guest], default: :guest, predicate: true

  has_many :user_chapter_joins, dependent: :destroy
  has_many :chapters, through: :user_chapter_joins
  has_many :user_guide_joins, dependent: :destroy
  has_many :guides, through: :user_guide_joins

  validates :email, :username, uniqueness: true
end
