class Cospul < ApplicationRecord
  belongs_to                    :user
  has_many                      :tag_cospuls                  ,dependent: :destroy
  has_many                      :tags, through: :tag_cospuls  ,dependent: :destroy
  has_many                      :likes                        , dependent: :destroy
  has_many                      :liking_users                 , through: :likes      , source: :user
  has_one                       :cospul_detail                , dependent: :destroy
  has_many                      :cospul_pictures              , dependent: :destroy
  accepts_nested_attributes_for :cospul_pictures              , allow_destroy: true, reject_if: :all_blank


  validates :title                                , presence: true, length: { in: 1..40 }
  validates :content                              , presence: true, length: { maximum: 1000 }
  validates :user                                 , presence: true
  validates :cospul_pictures                      , presence: true
end
