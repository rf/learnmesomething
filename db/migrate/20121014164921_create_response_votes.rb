class CreateResponseVotes < ActiveRecord::Migration
  def change
    create_table :response_votes do |t|
      t.references :response
      t.references :user

      t.timestamps
    end
    add_index :response_votes, :response_id
    add_index :response_votes, :user_id
  end
end
