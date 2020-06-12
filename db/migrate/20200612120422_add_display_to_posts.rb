class AddDisplayToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :display, :boolean, default: false
  end
end
