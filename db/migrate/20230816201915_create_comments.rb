class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.integer :author_id, null: false
      t.bigint :post_id, null: false
      t.text :text, null: false

      t.timestamps
    end
    add_index :comments, :post_id
    add_index :comments, :author_id
  end
end
