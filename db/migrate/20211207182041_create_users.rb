class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.text :about
      t.string :avatar
      t.string :link
      t.string :email
      t.string :personal_email

      t.timestamps
    end
  end
end
