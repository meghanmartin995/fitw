class CreatePostFonts < ActiveRecord::Migration[6.0]
  def change
    create_table :post_fonts do |t|
      t.references :font, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
