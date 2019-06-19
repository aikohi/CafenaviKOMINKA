class CreatePostComments < ActiveRecord::Migration[5.2]
  def change
    create_table :post_comments do |t|
      t.string :comment
      t.integer :user_id
      t.integer :shop_id
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
