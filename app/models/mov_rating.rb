class MovRating < ActiveRecord::Base
  belongs_to :user
  belongs_to :movie

  validates_numericality_of :rating, less_than_or_equal_to: 10, greater_than: 0
  validates :rating, presence: true
end
