class AddRegistrationCodeToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :registration_code, :string
  end
end
