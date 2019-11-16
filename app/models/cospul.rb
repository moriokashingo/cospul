class Cospul < ApplicationRecord
  Gutentag::ActiveRecord.call self
  scope :new_posts              , -> { order(created_at: :desc)}
  scope :post_includes          , -> { includes(:user,:likes,:cospul_pictures,:taggings,:tags )}
  scope :set_page               , -> (page){ page(page).per(9)}

  def tags_as_string
    tag_names.join(', ')
  end

  def tags_as_string=(string)
    self.tag_names = string.split(/,\s*/)
  end

  belongs_to                    :user
  has_many                      :likes                        , dependent: :destroy
  has_many                      :liking_users                 , through: :likes      , source: :user
  has_one                       :cospul_detail                , dependent: :destroy
  has_many                      :cospul_pictures              , dependent: :destroy
  accepts_nested_attributes_for :cospul_pictures              , allow_destroy: true, reject_if: :all_blank
  has_many                      :gutentag_taggings             ,dependent: :destroy,foreign_key: :taggable_id
  has_many                      :gutentag_tags                , through: :gutentag_taggings

  validates :title                                , presence: true, length: { in: 1..40 }
  validates :content                              , presence: true, length: { maximum: 1000 }
  validates :user                                 , presence: true
  validates :cospul_pictures                      , presence: true
end
