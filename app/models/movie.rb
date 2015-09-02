class Movie < ActiveRecord::Base

  belongs_to :user
  has_many :mov_ratings
  validates :name, presence: true
end
