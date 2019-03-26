class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :photo_url, null: false
      t.string :id_photo_url, null: false
      t.string :email
      t.string :phone_number, null: false

      t.timestamps
    end
  end
end
