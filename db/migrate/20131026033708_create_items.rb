class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :original_name
      t.binary :content
      t.integer :size
      t.integer :download_count
      t.datetime :expires_at
      t.string :password_digest
      t.text :message
      t.string :content_type

      t.timestamps
    end
  end
end
