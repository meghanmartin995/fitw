class AddSquarespaceToFonts < ActiveRecord::Migration[6.0]
  def change
    add_column :fonts, :squarespace, :boolean, default: false
  end
end
