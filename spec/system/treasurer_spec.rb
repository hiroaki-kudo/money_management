require 'rails_helper'
RSpec.describe 'CRUD機能', type: :system do
  before do
    user_parent = FactoryBot.create(:second_user)
    user_kid = FactoryBot.create(:third_user)
    management = FactoryBot.create(:management, parent_id: user_parent.id, kid_id: user_kid.id)
    FactoryBot.create(:second_treasurer, user_id: management.kid_id, management_id: management.id)
    FactoryBot.create(:third_treasurer, user_id: management.kid_id, management_id: management.id)
  end


  describe '新規作成機能' do
    context '使ったものなどを新規作成した場合' do
      it '使ったものなどが作成される' do
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
      end
    end
  end

  describe '詳細機能' do
    context '使ったものなどの詳細に遷移しようとした場合' do
      it '詳細画面に遷移できる' do
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
        expect(page).to have_content '使ったものなどの詳細な情報'
        expect(page).to have_content 'うまい棒'
      end
    end
  end

  describe '編集機能' do
    context '使ったものなどの情報を編集しようとした場合' do
      it '編集できる' do
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
        find('#edit_2').click
        fill_in 'treasurer[use_what]', with: 'ガム'
        click_button 'commit'
        expect(page).to have_content 'お金の流れの一覧'
        expect(page).to have_content 'ガム'
      end
    end
  end


  describe '削除機能' do
    context '使ったものなどの情報を削除しようとした場合' do
      it '削除できる' do
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
        find('#delete_2').click
        expect(page).to have_content 'お金の流れの一覧'
        expect(page).not_to have_content 'うまい棒'
      end
    end
  end
end
