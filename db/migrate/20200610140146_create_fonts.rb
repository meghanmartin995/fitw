class CreateFonts < ActiveRecord::Migration[6.0]
  def change
    create_table :fonts do |t|
      t.string :name
      t.boolean :free_personal, default: false
      t.boolean :free_commercial, default: false
      t.string :designer
      t.string :source

      t.timestamps
    end
  end
end
