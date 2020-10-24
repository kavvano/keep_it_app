class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :tweet

  validates :message, presence: true, length: { maximum: 255 }
end
