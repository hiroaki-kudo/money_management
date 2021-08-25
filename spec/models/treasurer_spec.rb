require 'rails_helper'

RSpec.describe Treasurer, type: :model do
  let(:second_user) { FactoryBot.create(:second_user) }
  let(:third_user) { FactoryBot.create(:third_user) }
  let(:management_user) { FactoryBot.create(:management, parent_id: second_user.id, kid_id: third_user.id) }
  let(:treasurer) { FactoryBot.create(:treasurer, user_id: third_user.id, management_id: management_user.id) }
  describe '空欄のバリデーションテスト' do
    context 'カテゴリが空欄の場合' do
      it 'バリデーションエラーになる' do
        treasurer.category_id = nil
        expect(treasurer).to be_invalid
      end
    end
    context '使った物が空欄の場合' do
      it 'バリデーションエラーになる' do
        treasurer.use_what = nil
        expect(treasurer).to be_invalid
      end
    end
  end

  describe '上限下限のバリデーションテスト' do
    context '使ったお金の下限の違反をしてた場合' do
      it 'バリデーションエラーになる' do
        treasurer.use_money = -1
        expect(treasurer).to be_invalid
      end
    end
    context '使ったお金の上限の違反をしてた場合' do
      it 'バリデーションエラーになる' do
        treasurer.use_money = 1000000
        expect(treasurer).to be_invalid
      end
    end
    context 'もらったお金の下限の違反をしてた場合' do
      it 'バリデーションエラーになる' do
        treasurer.get_money = -1
        expect(treasurer).to be_invalid
      end
    end
    context 'もらったお金の上限の違反をしてた場合' do
      it 'バリデーションエラーになる' do
        treasurer.get_money = 1000000
        expect(treasurer).to be_invalid
      end
    end
  end
end
