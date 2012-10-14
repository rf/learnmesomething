class AddFieldsToTags < ActiveRecord::Migration
  def change
    remove_column :tags, :request_id
    add_column :tags, :taggable_id, :integer
    add_column :tags, :taggable_type, :string
  end
end
