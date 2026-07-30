class AddImageToBlogs < ActiveRecord::Migration[8.0]
  def change
    add_column :blogs, :image, :string
  end
end
