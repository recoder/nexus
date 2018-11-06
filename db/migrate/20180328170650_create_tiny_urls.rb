class CreateTinyUrls < ActiveRecord::Migration[5.1]
  def change
    create_table :tiny_urls do |t|
      t.string :user_id, null: false
      t.string :slug, null: false
      t.string :url, null: false
      t.string :state, limit: 1, default: ''

      t.timestamps
    end

    add_index :tiny_urls, :slug, unique: true
  end
end
