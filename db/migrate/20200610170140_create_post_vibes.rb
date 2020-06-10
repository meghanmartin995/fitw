class CreatePostVibes < ActiveRecord::Migration[6.0]
  def change
    create_table :post_vibes do |t|
      t.references :post, null: false, foreign_key: true
      t.references :vibe, null: false, foreign_key: true

      t.timestamps
    end
  end
end
