class CreateExtwebsiteFonts < ActiveRecord::Migration[6.0]
  def change
    create_table :extwebsite_fonts do |t|
      t.references :font, null: false, foreign_key: true
      t.references :extwebsite, null: false, foreign_key: true

      t.timestamps
    end
  end
end
