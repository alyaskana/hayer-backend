class AddFormatToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :format, :string
  end
end
