class Tag < ApplicationRecord
  has_many :tweet_tags
  has_many :tweets, through: :tweet_tags

  validates :name, length: { maximum: 63 }, uniqueness: true
end
