class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :user
      t.references :product
      t.string :status
      t.string :no_resi
      t.string :address
      t.integer :total
      t.timestamps
    end
  end
end
