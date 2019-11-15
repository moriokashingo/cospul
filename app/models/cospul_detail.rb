class CospulDetail < ApplicationRecord
   belongs_to                    :cospul
   has_many                      :accessories         , dependent: :destroy
   accepts_nested_attributes_for :accessories         , allow_destroy: true, reject_if: :all_blank

   # validates                     :all_details         , presence: true
   # validates                     :cospul              , presence: true
   # validates                     :top                 , length: { maximum: 200 }
   # validates                     :head                , length: { maximum: 200 }
   # validates                     :inner               , length: { maximum: 200 }
   # validates                     :bottom              , length: { maximum: 200 }
   # validates                     :shoe                , length: { maximum: 200 }

   # private
   #    def all_details
   #       top.presence or head.presence or inner.presence or bottom.presence or shoe.presence
   #    end
end
