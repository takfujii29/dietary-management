class Food < ApplicationRecord
  has_many :managements, through: :management_foods
  has_many :users
  validates :name, presence: true, uniqueness: true
end
