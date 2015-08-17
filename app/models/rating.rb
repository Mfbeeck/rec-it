class Rating < ActiveRecord::Base
  belongs_to :user

  validates_numericality_of :score, less_than_or_equal_to: 10, greater_than: 0
  validates :score, presence: true
end
