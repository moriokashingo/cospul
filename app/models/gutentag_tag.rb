class GutentagTag < ApplicationRecord
  has_many  :gutentag_taggings    ,dependent: :destroy
  has_many  :cospuls            , through: :gutentag_taggings,dependent: :destroy

  validates :name               , uniqueness: { scope: :name }
end
