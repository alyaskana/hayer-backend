class AddKeyToAdTypes < ActiveRecord::Migration[6.1]
  def change
    add_column :ad_types, :key, :string
  end
end
