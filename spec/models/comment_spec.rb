require 'rails_helper'

RSpec.describe Management, type: :model do

  let(:second_user) { FactoryBot.create(:second_user) }
  let(:third_user) { FactoryBot.create(:third_user) }
  let(:management_user) { FactoryBot.create(:management, parent_id: second_user.id, kid_id: third_user.id) }
  let(:treasurer) { FactoryBot.create(:treasurer, user_id:third_user.id, management_id: management_user.id) }
  let(:comment) { FactoryBot.create(:comment, user_id: third_user.id, treasurer_id: treasurer.id ) }

  describe 'コメント機能に関してのバリデーション' do
    context 'コメントが空欄だった場合' do
      it '投稿できない' do
        comment.content = ""
        expect(comment).to be_invalid
      end
    end
  end
end
