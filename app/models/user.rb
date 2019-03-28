class User < ApplicationRecord
  validates_presence_of(
    :username,
    :photo_url,
    :id_photo_url,
    :email,
    :phone_number
  )
  has_many :creatives
end
