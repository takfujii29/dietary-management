class Management < ApplicationRecord
  belongs_to :user
  has_many :foods
  mount_uploader :image, ImageUploader
end
