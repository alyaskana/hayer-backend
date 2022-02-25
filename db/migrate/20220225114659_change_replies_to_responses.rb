class ChangeRepliesToResponses < ActiveRecord::Migration[6.1]
  def change
    rename_table :replies, :responses
  end
end
