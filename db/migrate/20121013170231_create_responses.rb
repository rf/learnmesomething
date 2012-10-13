class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.references :request
      t.references :user
      t.string :url
      t.string :title
      t.text :response
      t.integer :upvotes
      t.integer :downvotes

      t.timestamps
    end
    add_index :responses, :request_id
    add_index :responses, :user_id
  end
end
