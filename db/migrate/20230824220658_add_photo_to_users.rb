class AddPhotoToUsers < ActiveRecord::Migration[7.0]
  def change
    unless column_exists?(:users, :photo)
      add_column :users, :photo, :string
    end
  end
end
