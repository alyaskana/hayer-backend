class RemovePersonalEmailFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :personal_email
    remove_column :users, :interests
  end
end
