require 'rails_helper'

RSpec.describe TweetTag, type: :model do
  before do
    @tweet_tag = FactoryBot.build(:tweet_tag)
  end

  describe 'ツイートIDとタグIDの保存' do
    context '保存できるとき' do
      it 'tweetとtagが存在すれば保存できる' do
        expect(@tweet_tag).to be_valid
      end
    end

    context '保存できないとき' do
      it 'ユーザーが紐づいていないと保存できない' do
        @tweet_tag.tweet = nil
        @tweet_tag.valid?
        expect(@tweet_tag.errors.full_messages).to include('Tweetを入力してください')
      end
      it 'ツイートが紐づいていないと保存できない' do
        @tweet_tag.tag = nil
        @tweet_tag.valid?
        expect(@tweet_tag.errors.full_messages).to include('Tagを入力してください')
      end
    end
  end
end
