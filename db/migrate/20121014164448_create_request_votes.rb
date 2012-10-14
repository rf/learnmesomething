class CreateRequestVotes < ActiveRecord::Migration
  def change
    create_table :request_votes do |t|
      t.references :user
      t.references :request

      t.timestamps
    end
    add_index :request_votes, :user_id
    add_index :request_votes, :request_id
  end
end
