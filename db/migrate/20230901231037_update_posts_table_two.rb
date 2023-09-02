class UpdatePostsTableTwo < ActiveRecord::Migration[7.0]
  def change
    change_table :posts do |t|
      t.change :comments_counter, :integer, default: 0, null: true
      t.change :likes_counter, :integer, default: 0, null: true
    end
  end
end
