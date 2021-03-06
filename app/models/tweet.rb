class Tweet < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :keep_it_ups
  has_many :comments, dependent: :destroy
  has_many :tweet_tags, dependent: :destroy
  has_many :tags, through: :tweet_tags

  with_options presence: true do
    validates :user
    validates :text, length: { maximum: 255 }
  end
end
