class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.references :user
      t.string :title
      t.text :description
      t.integer :upvotes
      t.integer :downvotes

      t.timestamps
    end
    add_index :requests, :user_id
  end
end
