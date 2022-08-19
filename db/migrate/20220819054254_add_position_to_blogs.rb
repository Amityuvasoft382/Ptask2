class AddPositionToBlogs < ActiveRecord::Migration[7.0]
  def change
    add_column :blogs, :position, :boolean, default: false
  end
end
