class CreateAdTypesPosts < ActiveRecord::Migration[6.1]
  def change
    create_table :ad_types_posts do |t|
      t.references :post, null: false, foreign_key: true
      t.references :ad_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
