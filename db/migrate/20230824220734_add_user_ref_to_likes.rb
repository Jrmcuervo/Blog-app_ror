class AddUserRefToLikes < ActiveRecord::Migration[7.0]
  def change
    add_reference :posts, :user
    Post.update_all(user_id: 1)
    change_column_null :posts, :user_id, false
  end
  
end
