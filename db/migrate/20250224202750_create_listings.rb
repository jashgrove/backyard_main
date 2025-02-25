class CreateListings < ActiveRecord::Migration[7.1]
  def change
    create_table :listings do |t|
      t.string :name
      t.string :description
      t.string :address
      t.float :price_per_hour
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
