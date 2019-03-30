class CreateUsersProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products_users do |t|
      t.references :user, index: true
      t.references :product, index: true

      t.timestamps
    end
  end
end
