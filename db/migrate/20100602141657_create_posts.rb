class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.string :body, :null => false, :limit => 5000
      t.integer :comments_count, :null => false, :default => 0
      t.references :user

      t.timestamps
    end
    
    add_index :posts, :comments_count
  end

  def self.down
    drop_table :posts
  end
end
