class CreateListingReviews < ActiveRecord::Migration[7.1]
  def change
    create_table :listing_reviews do |t|
      t.string :content
      t.float :rating
      t.references :user, null: false, foreign_key: true
      t.references :listing, null: false, foreign_key: true

      t.timestamps
    end
  end
end
