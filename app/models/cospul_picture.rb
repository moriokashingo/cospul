class CospulPicture < ApplicationRecord
  belongs_to     :cospul
  mount_uploader :picture, ImageUploader
end
