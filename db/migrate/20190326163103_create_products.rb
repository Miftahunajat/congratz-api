class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.belongs_to :product_category, index: true
      t.string :name
      t.string :image_url
      t.string :price
      t.string :description

      t.timestamps
    end
  end
end
