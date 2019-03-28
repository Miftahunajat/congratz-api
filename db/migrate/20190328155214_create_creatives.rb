class CreateCreatives < ActiveRecord::Migration[5.2]
  def change
    create_table :creatives do |t|
      t.string :name
      t.string :image_url
      t.references :users, index: true

      t.timestamps
    end
  end
end
