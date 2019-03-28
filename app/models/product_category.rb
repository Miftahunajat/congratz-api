require 'carrierwave/orm/activerecord'
class ProductCategory < ApplicationRecord

  mount_uploader :image_url, ImagesUploader
  has_many :products

  validates_presence_of(
    :name,
    :image_url
  )
end
