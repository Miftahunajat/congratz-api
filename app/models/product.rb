class Product < ApplicationRecord
  mount_uploader :image_url, ImagesUploader
  belongs_to :product_category
  has_and_belongs_to_many :users
end
