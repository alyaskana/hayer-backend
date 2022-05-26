class AddCourseToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :course, :string
  end
end
