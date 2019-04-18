class User < ApplicationRecord
  has_many :user_favorites
  validates_presence_of(
    :username,
    :phone_number
  )
  has_many :creatives
  has_many :favorites, through: :user_favorites, source: :product
  has_many :products
  mount_base64_uploader :photo_url, ImagesUploader
  mount_base64_uploader :id_photo_url, ImagesUploader
  has_many :cartshas
  has_many :orders
end
