class User < ApplicationRecord
  has_many :user_favorites
  validates_presence_of(
    :username,
    :photo_url,
    :id_photo_url,
    :email,
    :phone_number
  )
  has_many :creatives
  has_many :favorites, through: :user_favorites, source: :product
  has_and_belongs_to_many :products
end
