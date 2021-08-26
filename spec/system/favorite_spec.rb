require 'rails_helper'
RSpec.describe 'お気に入り機能', type: :system do
  before do
    user_parent = FactoryBot.create(:second_user)
    user_kid = FactoryBot.create(:third_user)
    management = FactoryBot.create(:management, parent_id: user_parent.id, kid_id: user_kid.id)
    FactoryBot.create(:second_treasurer, user_id: management.kid_id, management_id: management.id)
    FactoryBot.create(:third_treasurer, user_id: management.kid_id, management_id: management.id)
  end

  describe 'お気に入り機能' do
    context 'お気に入りにするボタンを押してその後お気に入りを解除するボタンを押した場合' do
      it 'お気に入り登録及び解除ができる' do
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
        click_on 'お気に入りにする'
        expect(page).to have_content 'お気に入りの一覧'
        expect(page).to have_content 'うまい棒'
        click_on '使ったもの一覧'
        find('#detail_2').click
        click_on 'お気に入り解除する'
        expect(page).to have_content 'お気に入りの一覧'
        expect(page).not_to have_content 'うまい棒'
      end
    end
  end
end
