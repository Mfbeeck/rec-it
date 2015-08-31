class Movie < ActiveRecord::Base

  belongs_to :user

  validates_numericality_of :rating, less_than_or_equal_to: 10, greater_than: 0
  validates :rating, presence: true
  validates :name, presence: true
end
