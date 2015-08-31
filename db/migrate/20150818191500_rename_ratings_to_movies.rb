class RenameRatingsToMovies < ActiveRecord::Migration
  def change
    rename_table :ratings, :movies
  end
end
