class CreateFontCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :font_categories do |t|
      t.references :font, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
