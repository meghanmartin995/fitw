class CreateFontTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :font_types do |t|
      t.references :font, null: false, foreign_key: true
      t.references :type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
