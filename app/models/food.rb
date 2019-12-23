class Food < ApplicationRecord
  # belongs_to :user, optional: true
  # belongs_to :management
  has_many :user_foods
  has_many :users, through: :user_foods
  validates :name, presence: true, uniqueness: true
end
