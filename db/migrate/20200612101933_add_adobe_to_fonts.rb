class AddAdobeToFonts < ActiveRecord::Migration[6.0]
  def change
    add_column :fonts, :adobe, :boolean, default: false
  end
end
