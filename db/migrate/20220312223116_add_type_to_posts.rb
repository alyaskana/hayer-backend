class AddTypeToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :type, :string, array: true
  end
end
