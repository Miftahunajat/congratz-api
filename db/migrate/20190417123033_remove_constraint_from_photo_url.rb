class RemoveConstraintFromPhotoUrl < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :photo_url, :string, null: true
    remove_column :users, :id_photo_url
  end
end
