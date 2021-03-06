class Management < ApplicationRecord
  belongs_to :user
  has_many :management_foods
  has_many :foods, through: :management_foods, dependent: :delete_all
  mount_uploader :image, ImageUploader
end
