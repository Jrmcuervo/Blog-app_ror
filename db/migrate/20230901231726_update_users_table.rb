class UpdateUsersTable < ActiveRecord::Migration[7.0]
  def change
    change_column_null :users, :name, true
    change_column_null :users, :posts_counter, true

    change_column_default :users, :posts_counter, nil
  end
end
