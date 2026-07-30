class CreateBlogs < ActiveRecord::Migration[8.0]
  def change
    create_table :blogs do |t|
      t.string :title
      t.string :slug
      t.boolean :published
      t.datetime :published_at

      t.timestamps
    end
  end
end
