class GutentagTag < ApplicationRecord
  has_many  :gutentag_tagging    ,dependent: :destroy
  has_many  :cospuls            , through: :gutentag_tagging,dependent: :destroy

  validates :name               , uniqueness: { scope: :name }
end
