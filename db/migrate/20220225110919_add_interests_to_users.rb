class AddInterestsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :interests, :string, array: true
  end
end
