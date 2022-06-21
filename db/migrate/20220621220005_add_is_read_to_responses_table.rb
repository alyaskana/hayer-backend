class AddIsReadToResponsesTable < ActiveRecord::Migration[6.1]
  def change
    add_column :responses, :is_read, :boolean, default: false
  end
end
