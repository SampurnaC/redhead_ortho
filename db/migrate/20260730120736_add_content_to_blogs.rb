class AddContentToBlogs < ActiveRecord::Migration[8.0]
  def change
    add_column :blogs, :content, :text
  end
end
