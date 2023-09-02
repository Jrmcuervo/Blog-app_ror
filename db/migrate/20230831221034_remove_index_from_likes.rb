class RemoveIndexFromLikes < ActiveRecord::Migration[7.0]
  def change
    remove_index :likes, name: "index_likes_on_author_id"
  end
end
