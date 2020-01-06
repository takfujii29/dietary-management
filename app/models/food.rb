class Food < ApplicationRecord
  belongs_to :management, optional: true
  has_many :users
  validates :name, presence: true, uniqueness: true
end
