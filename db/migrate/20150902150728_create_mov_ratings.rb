class CreateMovRatings < ActiveRecord::Migration
  def change
    create_table :mov_ratings do |t|
      t.float :rating
      t.references :user, index: true, foreign_key: true
      t.references :movie, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
