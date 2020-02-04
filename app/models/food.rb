class Food < ApplicationRecord
  belongs_to :management, optional: true
  has_many :users
  has_many :management_foods
  validates :name, presence: true, uniqueness: true
end
