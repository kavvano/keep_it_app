require 'rails_helper'

RSpec.describe Tag, type: :model do
  before do
    @tag = FactoryBot.build(:tag)
  end

  describe 'タグ保存' do
    context 'タグ保存できるとき' do
      it 'nameが存在すればタグ保存できる' do
        expect(@tag).to be_valid
      end
    end

    context 'タグ保存できないとき' do
      it 'nameが64文字以上ではタグ保存できない' do
        @tag.name = Faker::Lorem.characters(number: 64)
        @tag.valid?
        expect(@tag.errors.full_messages).to include('Nameは63文字以内で入力してください')
      end
      it '同じnameが存在する場合タグ保存できない' do
        @tag.save
        another_tag = FactoryBot.build(:tag)
        another_tag.name = @tag.name
        another_tag.valid?
        expect(another_tag.errors.full_messages).to include('Nameはすでに存在します')
      end
    end
  end
end
