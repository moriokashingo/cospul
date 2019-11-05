class CospulDetail < ApplicationRecord
   belongs_to                    :cospul
   has_many                      :accessories         , dependent: :destroy
   accepts_nested_attributes_for :accessories         , allow_destroy: true, reject_if: :all_blank
end
