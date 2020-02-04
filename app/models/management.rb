class Management < ApplicationRecord
  belongs_to :user
  has_many :foods, through: :management_foods
  mount_uploader :image, ImageUploader
end
