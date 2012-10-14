class CreateRequestTags < ActiveRecord::Migration
  def change
    create_table :request_tags do |t|
      t.references :request
      t.references :tag

      t.timestamps
    end
    add_index :request_tags, :request_id
    add_index :request_tags, :tag_id
  end
end
