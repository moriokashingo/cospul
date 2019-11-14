class Tag < ApplicationRecord
  has_many  :tag_cospuls        ,dependent: :destroy
  has_many  :cospuls            , through: :tag_cospuls,dependent: :destroy

  validates :name               , uniqueness: { scope: :name }
end
