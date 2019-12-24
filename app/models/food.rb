class Food < ApplicationRecord
  belongs_to :management, optional: true
  validates :name, presence: true, uniqueness: true
end
