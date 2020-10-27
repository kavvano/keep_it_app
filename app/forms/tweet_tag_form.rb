class TweetTagForm
  include ActiveModel::Model
  attr_accessor :text, :image, :user_id, :name, :tweet_id, :tag_id, :id

  with_options presence: true do
    validates :user_id
    validates :text, length: { maximum: 255 }
  end

  validates :name, length: { maximum: 255 }

  def save
    tweet = Tweet.create(text: text, image: image, user_id: user_id)
    if name.present?
      tag = Tag.where(name: name).first_or_initialize
      tag.save
      TweetTag.create(tweet_id: tweet.id, tag_id: tag.id)
    end
  end

  def update
    tweet = Tweet.find(id)
    tweet.update(text: text, image: image, user_id: user_id)
    if name.present?
      tag = Tag.where(name: name).first_or_initialize
      tag.save
      tweet_tag = TweetTag.where(tweet_id: tweet.id)
      if tweet_tag.present?
        tweet_tag.update(tweet_id: tweet.id, tag_id: tag.id)
      else
        TweetTag.create(tweet_id: tweet.id, tag_id: tag.id)
      end
    end
  end
end
