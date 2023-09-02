class ModifyPosts < ActiveRecord::Migration[7.0]
  def change
    change_column_null :posts, :title, true
    change_column_null :posts, :text, true
    
    change_column_default :posts, :comments_counter, from: 0, to: nil
    change_column_default :posts, :likes_counter, from: 0, to: nil
  end
end
