class Product < ApplicationRecord
  mount_base64_uploader :image_url, ImagesUploader
  belongs_to :product_category
  belongs_to :user, optional: :true
end
