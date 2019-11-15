class CospulPicture < ApplicationRecord
  belongs_to     :cospul
  mount_uploader :picture  , ImageUploader
  validates      :picture  , presence: true
  validates      :cospul   , presence: true
end
