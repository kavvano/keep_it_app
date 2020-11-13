require 'rails_helper'

RSpec.describe KeepItUp, type: :model do
  before do
    @keep_it_up = FactoryBot.build(:keep_it_up)
  end

  describe 'いいね' do
    context 'いいねできるとき' do
      it 'userとtweetが存在すればいいねできる' do
        expect(@keep_it_up).to be_valid
      end
    end

    context 'いいねできないとき' do
      it 'ユーザーが紐づいていないといいねできない' do
        @keep_it_up.user = nil
        @keep_it_up.valid?
        expect(@keep_it_up.errors.full_messages).to include('Userを入力してください')
      end
      it 'ツイートが紐づいていないといいねできない' do
        @keep_it_up.tweet = nil
        @keep_it_up.valid?
        expect(@keep_it_up.errors.full_messages).to include('Tweetを入力してください')
      end
    end
  end
end
