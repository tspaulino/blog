class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.belongs_to :admin_user
      t.string :title
      t.text :teaser
      t.text :text
      t.boolean :published, :default => false
      t.string :slug

      t.timestamps
    end
    add_index :posts, :admin_user_id
    add_index :posts, :slug, :unique => true
  end
end
