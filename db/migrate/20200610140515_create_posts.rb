class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :website
      t.string :url

      t.timestamps
    end
  end
end
