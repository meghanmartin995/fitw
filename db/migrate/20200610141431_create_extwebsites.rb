class CreateExtwebsites < ActiveRecord::Migration[6.0]
  def change
    create_table :extwebsites do |t|
      t.string :name

      t.timestamps
    end
  end
end
