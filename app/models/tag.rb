class Tag < ApplicationRecord
  has_many :tweet_tags
  has_many :tweets, through: :tweet_tags

  validates :name, uniqueness: true
end
