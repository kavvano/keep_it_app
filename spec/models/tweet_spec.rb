require 'rails_helper'

RSpec.describe Tweet, type: :model do
  before do
    @tweet = FactoryBot.build(:tweet)
  end

  describe 'ツイート投稿' do
    context 'ツイート投稿できるとき' do
      it 'textとimageが存在すれば投稿できる' do
        expect(@tweet).to be_valid
      end
      it 'imageが空でも投稿できる' do
        @tweet.image = ""
        expect(@tweet).to be_valid
      end
    end

    context 'ツイート投稿できないとき' do
      it 'textが空では投稿できない' do
        @tweet.text = ''
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Textを入力してください")
      end
      it 'ユーザーが紐づいていないと投稿できない' do
        @tweet.user = nil
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Userを入力してください")
      end
    end
  end
end
