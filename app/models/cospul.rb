class Cospul < ApplicationRecord
  belongs_to                    :user
  has_many                      :tag_cospuls,dependent: :destroy
  has_many                      :tags, through: :tag_cospuls,dependent: :destroy
  has_many                      :likes, dependent: :destroy
  has_many                      :liking_users, through: :likes, source: :user
  has_one                       :cospul_detail, dependent: :destroy
  has_many                      :cospul_pictures, dependent: :destroy
  accepts_nested_attributes_for :cospul_pictures, allow_destroy: true, reject_if: :all_blank
end
