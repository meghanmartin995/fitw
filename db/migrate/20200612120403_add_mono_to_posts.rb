class AddMonoToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :mono, :boolean, default: false
  end
end
