require 'rails_helper'

RSpec.describe Management, type: :model do

  let(:second_user) { FactoryBot.create(:second_user) }
  let(:third_user) { FactoryBot.create(:third_user) }
  let(:fourth_user) { FactoryBot.create(:fourth_user) }
  let(:fifth_user) { FactoryBot.create(:fifth_user) }
  let(:management_user) { FactoryBot.create(:management, parent_id: second_user.id, kid_id: third_user.id) }
  describe '親子登録に関してのバリデーションテスト' do
    context 'メールアドレスが空欄の場合' do
      it 'バリデーションエラーになる' do
        management_user.email = ""
        expect(management_user).to be_invalid
      end
    end
    context 'メールアドレスが256文字以上の場合' do
      it 'バリデーションエラーになる' do
        management_user.email = 'oya@oya.com' * 26
        expect(management_user).to be_invalid
      end
    end
    context 'メールアドレスが重複した場合,' do
      it 'バリデーションエラーになる' do
        user = Management.new(
          email: 'kodomo@kodomo.com',
          parent_id: second_user.id,
          kid_id: third_user.id,
        )
        expect(user).not_to be_invalid
      end
    end
    context 'メールアドレスが無効な形式の場合' do
      it 'バリデーションエラーになる' do
        management_user.email = 'aaaaaaa'
        expect(management_user).to be_invalid
      end
    end
  end
end
