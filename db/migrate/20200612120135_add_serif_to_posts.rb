class AddSerifToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :serif, :boolean, default: false
  end
end
