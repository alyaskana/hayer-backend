class AddEduProgramToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :edu_program, :string
  end
end
