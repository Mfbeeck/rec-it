class RenameScoreToRating < ActiveRecord::Migration
  def change
  	rename_column :movies, :score, :rating
  end
end
