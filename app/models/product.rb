class Product < ApplicationRecord
  mount_uploader :image_url, ImagesUploader
  belongs_to :product_category
end
