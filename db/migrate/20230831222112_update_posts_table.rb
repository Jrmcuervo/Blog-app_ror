class UpdatePostsTable < ActiveRecord::Migration[7.0]
  def change
    change_table :posts do |t|
      t.change :comments_counter, :integer, default: 0
      t.change :likes_counter, :integer, default: 0
    end
  end
end
