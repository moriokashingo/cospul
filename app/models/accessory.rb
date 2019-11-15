class Accessory < ApplicationRecord
  belongs_to :cospul_detail
  # validates  :cospul_detail   , presence: true
  # validates  :name            , presence: true, length: { maximum: 200 }
end
