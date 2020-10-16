class Tweet < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :keep_it_ups
  has_many :comments
  has_many :tags, through: :tweet_tags

  with_options presence: true do
    validates :user, :text
  end
end
