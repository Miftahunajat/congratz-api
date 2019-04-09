class Cart < ApplicationRecord
  belongs_to :user
  belongs_to :product

  def total
    price.to_i * count.to_i
  end
end
