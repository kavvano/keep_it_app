require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end

  describe 'コメント投稿' do
    context 'コメント投稿できるとき' do
      it 'messageが存在すれば投稿できる' do
        expect(@comment).to be_valid
      end
      it 'messageが255文字以内であれば投稿できる' do
        @comment.message = Faker::Lorem.characters(number: 255)
        expect(@comment).to be_valid
      end
    end

    context 'コメント投稿できないとき' do
      it 'messageが空では投稿できない' do
        @comment.message = ''
        @comment.valid?
        expect(@comment.errors.full_messages).to include('コメントを入力してください')
      end
      it 'textが256文字以上では投稿できない' do
        @comment.message = Faker::Lorem.characters(number: 256)
        @comment.valid?
        expect(@comment.errors.full_messages).to include('コメントは255文字以内で入力してください')
      end
      it 'ユーザーが紐づいていないと投稿できない' do
        @comment.user = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include('Userを入力してください')
      end
      it 'ツイートが存在しないと投稿できない' do
        @comment.tweet = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include('Tweetを入力してください')
      end
    end
  end
end
