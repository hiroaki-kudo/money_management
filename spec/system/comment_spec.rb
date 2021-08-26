require 'rails_helper'
RSpec.describe 'コメント機能', type: :system do
  before do
    user_parent = FactoryBot.create(:second_user)
    user_kid = FactoryBot.create(:third_user)
    management = FactoryBot.create(:management, parent_id: user_parent.id, kid_id: user_kid.id)
    FactoryBot.create(:second_treasurer, user_id: management.kid_id, management_id: management.id)
    FactoryBot.create(:third_treasurer, user_id: management.kid_id, management_id: management.id)
  end



  describe 'コメント投稿機能' do
    context '子がコメントした場合' do
      it 'コメントした内容が詳細画面に表示される' do
        visit new_session_path
        fill_in 'Email', with: 'kodomo@kodomo.com'
        fill_in 'Password', with: '123qwe'
        click_button 'commit'
        click_on '使ったもの一覧'
        click_on '使った物などを登録'
        fill_in 'treasurer[use_date_at]', with: '002025-07-01'
        select '食べ物・飲み物'
        fill_in 'treasurer[use_what]', with: 'うまい棒'
        fill_in 'treasurer[use_money]', with: 10
        click_button 'commit'
        click_button 'commit'
        expect(page).to have_content 'お金の流れの一覧'
        expect(page).to have_content 'うまい棒'
        find('#detail_2').click
        fill_in 'comment[content]', with: 'おいしかった'
        click_button 'commit'
        expect(page).to have_content 'おいしかった'
      end
    end
    context '子コメントを削除した場合' do
      it 'コメントした内容が削除される' do
        visit new_session_path
        fill_in 'Email', with: 'kodomo@kodomo.com'
        fill_in 'Password', with: '123qwe'
        click_button 'commit'
        click_on '使ったもの一覧'
        click_on '使った物などを登録'
        fill_in 'treasurer[use_date_at]', with: '002025-07-01'
        select '食べ物・飲み物'
        fill_in 'treasurer[use_what]', with: 'うまい棒'
        fill_in 'treasurer[use_money]', with: 10
        click_button 'commit'
        click_button 'commit'
        expect(page).to have_content 'お金の流れの一覧'
        expect(page).to have_content 'うまい棒'
        find('#detail_2').click
        fill_in 'comment[content]', with: 'おいしかった'
        click_button 'commit'
        expect(page).to have_content 'おいしかった'
        click_on 'コメント削除'
        expect(page).not_to have_content 'おいしかった'
      end
    end
    context '親がコメントした場合' do
      it 'コメントした内容が詳細画面に表示される' do
        visit new_session_path
        fill_in 'Email', with: 'oya@oya.com'
        fill_in 'Password', with: '123qwe'
        click_button 'commit'
        click_on '子供一覧'
        find('#detail_0').click
        find('#detail_0').click
        fill_in 'comment[content]', with: 'お勉強がんばってね'
        click_button 'commit'
        expect(page).to have_content 'お勉強がんばってね'
      end
    end
    context '親がコメントを削除した場合' do
      it 'コメントした内容が削除される' do
        visit new_session_path
        fill_in 'Email', with: 'oya@oya.com'
        fill_in 'Password', with: '123qwe'
        click_button 'commit'
        click_on '子供一覧'
        find('#detail_0').click
        find('#detail_0').click
        fill_in 'comment[content]', with: 'お勉強がんばってね'
        click_button 'commit'
        expect(page).to have_content 'お勉強がんばってね'
        click_on 'コメント削除'
        expect(page).not_to have_content 'お勉強がんばってね'
      end
    end
  end
end
