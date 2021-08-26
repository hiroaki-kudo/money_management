require 'rails_helper'
RSpec.describe '親子関係の登録機能', type: :system do

  let!(:second_user) { FactoryBot.create(:second_user)}
  let!(:third_user) { FactoryBot.create(:third_user)}
  describe '親子関係の登録に関するテスト' do
    context '親子関係を登録しようとした場合' do
      it '登録できる' do
        visit new_session_path
        fill_in 'session[email]', with: 'oya@oya.com'
        fill_in 'session[password]', with: '123qwe'
        click_on 'commit'
        click_on '親子関係の登録'
        fill_in 'management[email]', with: 'kodomo@kodomo.com'
        click_on 'commit'
        expect(page).to have_content '親子関係を設定しました'
      end
    end
  end
end
