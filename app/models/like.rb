class Like < ApplicationRecord
  belongs_to              :cospul     , counter_cache: :likes_count
  belongs_to              :user
  validates_uniqueness_of :cospul_id  , scope: :user_id
end