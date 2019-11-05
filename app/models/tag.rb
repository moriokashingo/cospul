class Tag < ApplicationRecord
  validates :name               , uniqueness: { scope: :name }

  has_many  :tag_cospuls        ,dependent: :destroy
  has_many  :cospuls            , through: :tag_cospuls,dependent: :destroy

end
