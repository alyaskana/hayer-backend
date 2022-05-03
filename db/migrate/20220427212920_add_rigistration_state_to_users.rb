class AddRigistrationStateToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :registration_state, :string, default: :draft
  end
end
