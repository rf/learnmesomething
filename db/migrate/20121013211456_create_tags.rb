class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.references :request
      t.string :name

      t.timestamps
    end
    add_index :tags, :request_id
  end
end
