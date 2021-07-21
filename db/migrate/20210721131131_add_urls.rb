class AddUrls < ActiveRecord::Migration[6.0]
  def change
    create_table :urls do |t|
      t.string :short_hash, null: false
      t.string :url, null: false
      t.integer :views_count, null: false, default: 0

      t.timestamps
    end

    add_index :urls, [:short_hash], unique: true
  end
end
