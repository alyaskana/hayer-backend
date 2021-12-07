class CreateFollows < ActiveRecord::Migration[6.1]
  def change
    create_table :follows do |t|
      t.references :follower, null: false
      t.references :following, null: false

      t.timestamps
    end
    
    add_foreign_key :follows, :users, column: :follower_id, primary_key: :id
    add_foreign_key :follows, :users, column: :following_id, primary_key: :id
  end
end