require 'rails_helper'
RSpec.describe 'ユーザー管理機能', type: :system do
  before do
    FactoryBot.create(:user)
    FactoryBot.create(:second_user)
    FactoryBot.create(:third_user)
    FactoryBot.create(:fourth_user)
    FactoryBot.create(:fifth_user)
  end

  describe 'ユーザに関するテスト' do
    context '親ユーザーが新規登録をした場合' do
      it 'ログイン画面へ遷移する' do
        visit new_user_path
        fill_in 'user[name]', with: '工藤'
        fill_in 'user[email]', with: 'kudou@kudou.com'
        select '親'
        fill_in 'user[password]', with: '123qwe'
        fill_in 'user[password_confirmation]', with: '123qwe'
        click_button '登録する'
        expect(page).to have_content '工藤'
        expect(page).to have_content 'kudou@kudou.com'
      end
    end
    context '作成ずみの親アカウントでログインしたい場合' do
      it 'ログインしたあと、ユーザ詳細ページへ飛ぶ' do
        visit new_session_path
        fill_in 'session[email]', with: 'oya@oya.com'
        fill_in 'session[password]', with: '123qwe'
        click_on 'commit'
        expect(page).to have_content 'ログイン中'
        expect(page).to have_content '親'
        expect(page).to have_content 'oya@oya.com'
      end
    end
    context 'ログアウトを押した場合' do
      it 'ログアウトできる' do
        visit new_session_path
        fill_in 'session[email]', with: 'oya@oya.com'
        fill_in 'session[password]', with: '123qwe'
        click_on 'commit'
        click_on "ログアウト"
        expect(page).to have_content 'ログアウトしました'
      end
    end
    context '子ユーザーが新規登録をした場合' do
      it 'ログイン画面へ遷移する' do
        visit new_user_path
        fill_in 'user[name]', with: '孫'
        fill_in 'user[email]', with: 'kid@kid.com'
        select '子'
        fill_in 'user[password]', with: '123qwe'
        fill_in 'user[password_confirmation]', with: '123qwe'
        click_button '登録する'
        expect(page).to have_content 'kid'
        expect(page).to have_content 'kid@kid.com'
      end
    end
    context '作成ずみの子アカウントでログインしたい場合' do
      it 'ログインしたあと、ユーザ詳細ページへ飛ぶ' do
        visit new_session_path
        fill_in 'session[email]', with: 'kodomo@kodomo.com'
        fill_in 'session[password]', with: '123qwe'
        click_on 'commit'
        expect(page).to have_content 'ログイン中'
        expect(page).to have_content '子供'
        expect(page).to have_content 'kodomo@kodomo.com'
      end
    end
    context 'ログアウトを押した場合' do
      it 'ログアウトできる' do
        visit new_session_path
        fill_in 'session[email]', with: 'kodomo@kodomo.com'
        fill_in 'session[password]', with: '123qwe'
        click_on 'commit'
        click_on "ログアウト"
        expect(page).to have_content 'ログアウトしました'
      end
    end
    context '管理者がログインした場合' do
      it '管理者の画面にいくことができる' do
        visit new_session_path
        fill_in 'session[email]', with: 'kanri@kanri.com'
        fill_in 'session[password]', with: '123qwe'
        click_on 'commit'
        expect(page).to have_content '管理者ユーザ'
      end
    end
  end
end

describe 'ゲストログイン機能(子)' do
  context '子がゲストログインする場合' do
    it 'ゲストユーザーとしてログインできる' do
      visit root_path
      click_on 'ゲストログイン(子)'
      expect(page).to have_content 'ゲストユーザ(子)のページ'
    end
  end
  context '親がゲストログインする場合' do
    it 'ゲストユーザーとしてログインできる' do
      visit root_path
      click_on 'ゲストログイン()'
      expect(page).to have_content 'ゲストユーザ(子)のページ'
    end
  end
  context '子がゲストログインする場合' do
    it 'ゲストユーザーとしてログインできる' do
      visit root_path
      click_on 'ゲストログイン(子)'
      expect(page).to have_content 'ゲストユーザ(子)のページ'
    end
  end
end



  #
  # context '管理者ユーザーのゲストログインボタンを押した時' do
  #   it '管理者ユーザーでゲストログインできる' do
  #     find('#admin_guest_login').click
  #     expect(page).to have_content 'ログインしまし'
  #     expect(page).to have_content 'admin_guest@guest.com'
  #   end
  # end



  #   context 'ログアウトボタンを押した時' do
  #     it 'ログアウトできる' do
  #       find('#guest_login').click
  #       expect(page).to have_content 'ログインしました(ゲスト)'
  #       click_on 'ログアウト'
  #       expect(current_path).to eq '/'
  #     end
  #   end


#   context '管理者ユーザーがログアウトボタンを押した時' do
#     it 'ログアウトできる' do
#       find('#admin_guest_login').click
#       expect(page).to have_content 'ログインしました。(管理者ゲスト)'
#       expect(page).to have_content 'admin_guest@guest.com'
#       click_on 'ログアウト'
#       expect(current_path).to eq '/'
#     end
#   end
# end



#
# describe 'セッション機能に関するテスト' do
#   context 'ユーザーがログインした場合' do
#     it 'ログインできていること' do
#       visit new_session_path
#       fill_in 'Email', with: 'kudou@kudou.com'
#       fill_in 'Password', with: 'kudoukudou'
#       click_button 'commit'
#       expect(page).to have_content 'ログイン中'
#     end
#   end
#   context 'ユーザーがログインした場合' do
#     it '自分のマイページへ飛ぶ' do
#       visit new_session_path
#       fill_in 'Email', with: 'satou@satou.com'
#       fill_in 'Password', with: 'satousatou'
#       click_button 'commit'
#       expect(page).to have_content 'satou'
#       expect(page).to have_content 'satou@satou.com'
#     end
#   end
#   context '一般ユーザーが他人の詳細画面に飛んだ場合' do
#     it 'タスク一覧画面に遷移' do
#
#     end
#   end

# end
#
# describe '管理画面のテスト' do
#   context '管理ユーザーが管理画面にアクセスした場合' do
#     it 'アクセスできる' do
#       visit new_session_path
#       fill_in 'Email', with: 'kamisama@kamisama.com'
#       fill_in 'Password', with: 'kamisamakamisama'
#       click_button 'commit'
#       click_on '管理者画面へ'
#       expect(page).to have_content '管理画面のユーザー一覧画面'
#     end
#   end
#   context '一般ユーザーが管理画面にアクセスした場合' do
#     it 'アクセスできない' do
#       visit new_session_path
#       fill_in 'Email', with: 'satou@satou.com'
#       fill_in 'Password', with: 'satousatou'
#       click_button 'commit'
#       click_on '管理者画面へ'
#       expect(page).to have_content '管理者以外はアクセスできません'
#     end
#   end
#   context '管理ユーザーはユーザーの新規登録をしようとした場合' do
#     it '登録できる' do
#       visit new_session_path
#       fill_in 'Email', with: 'kamisama@kamisama.com'
#       fill_in 'Password', with: 'kamisamakamisama'
#       click_button 'commit'
#       click_on '管理者画面へ'
#       click_on 'ユーザーの新規作成'
#       fill_in 'user[name]', with: 'natou'
#       fill_in 'user[email]', with: 'naitou@naitou.com'
#       fill_in 'user[password]', with: 'naitounaitou'
#       fill_in 'user[password_confirmation]', with: 'naitounaitou'
#       click_button 'commit'
#       expect(page).to have_content 'naitou'
#       expect(page).to have_content 'naitou@naitou.com'
#     end
#   end
#   context '管理ユーザーはユーザーの詳細画面にアクセスしようとした場合' do
#     it 'アクセスできる' do
#       visit new_session_path
#       fill_in 'Email', with: 'kamisama@kamisama.com'
#       fill_in 'Password', with: 'kamisamakamisama'
#       click_button 'commit'
#       click_on '管理者画面へ'
#       user = User.find_by(name: 'kudou')
#       click_link '詳細ページを表示', href: admin_user_path(user.id)
#       expect(page).to have_content 'kudou'
#       expect(page).to have_content 'kudou@kudou.com'
#     end
#   end
#   context '管理ユーザーはユーザーの編集画面に行く場合' do
#     it '編集できる' do
#       visit new_session_path
#       fill_in 'Email', with: 'kamisama@kamisama.com'
#       fill_in 'Password', with: 'kamisamakamisama'
#       click_button 'commit'
#       click_on '管理者画面へ'
#       user = User.find_by(name: 'kudou')
#       click_link '情報を編集する', href: edit_admin_user_path(user.id)
#       fill_in 'user[name]', with: 'katou'
#       fill_in 'user[email]', with: 'katou@katou.com'
#       fill_in 'user[password]', with: 'katoukatou'
#       fill_in 'user[password_confirmation]', with: 'katoukatou'
#       click_button 'commit'
#       expect(page).to have_content 'katou'
#     end
#   end
#   context '管理ユーザーはユーザーの削除をしようとした場合' do
#     it '削除できる' do
#       visit new_session_path
#       fill_in 'Email', with: 'kamisama@kamisama.com'
#       fill_in 'Password', with: 'kamisamakamisama'
#       click_button 'commit'
#       click_on '管理者画面へ'
#       user = User.find_by(name: 'kudou')
#       click_link '情報を削除する', href: admin_user_path(user.id)
#       expect(page).not_to have_content 'kudou'
#     end
#   end
