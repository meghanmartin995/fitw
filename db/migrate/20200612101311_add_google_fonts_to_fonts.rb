class AddGoogleFontsToFonts < ActiveRecord::Migration[6.0]
  def change
    add_column :fonts, :google, :boolean, default: false
  end
end
