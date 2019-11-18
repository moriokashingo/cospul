class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
  has_many       :cospuls     , dependent: :destroy
  has_many       :likes       , dependent: :destroy
  has_many       :like_cospuls, through: :likes     , source: :cospul
  mount_uploader :image       , PictureUploader
  validates      :name        , presence: true      ,length:  { maximum: 20 }
end
