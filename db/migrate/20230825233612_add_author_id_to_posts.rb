class AddAuthorIdToPosts < ActiveRecord::Migration[7.0]
  def change
    Comment.delete_all
    Post.delete_all
    add_column :posts, :author_id, :integer, null: false
  end
end

