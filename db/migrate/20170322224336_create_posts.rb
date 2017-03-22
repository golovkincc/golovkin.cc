class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :lang, null: false, default: 'ru'
      t.boolean :active, default: true
      t.integer :sort, default: 100
      t.datetime :published_at, null:false, default: -> { 'CURRENT_TIMESTAMP' }
      t.string :name
      t.string :picture
      t.text :words
      t.string :author
      t.string :ref
      t.integer :user_id, index: true
      t.integer :admin_user_id, index: true

      t.timestamps
    end
  end
end
