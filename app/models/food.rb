class Food < ApplicationRecord
  has_many :managements, through: :management_foods
  has_many :users
  has_many :management_foods
  validates :name, presence: true, uniqueness: true
end
