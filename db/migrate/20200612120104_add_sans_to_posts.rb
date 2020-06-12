class AddSansToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :sans, :boolean, default: false
  end
end
