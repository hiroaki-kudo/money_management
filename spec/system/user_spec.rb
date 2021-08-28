require 'rails_helper'
RSpec.describe 'ユーザー機能', type: :system do
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
      it 'ログインしたあと、お金の流れの一覧へ飛ぶ' do
        visit new_session_path
        fill_in 'session[email]', with: 'kodomo@kodomo.com'
        fill_in 'session[password]', with: '123qwe'
        click_on 'commit'
        expect(page).to have_content 'お金の流れの一覧'
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
      click_on 'ゲストログイン(親)'
      expect(page).to have_content 'ゲストユーザ(親)のページ'
    end
  end
  context '管理者がゲストログインする場合' do
    it 'ゲストユーザーとしてログインできる' do
      visit root_path
      click_on '管理者ゲストログイン'
      expect(page).to have_content '管理者ユーザのページ'
    end
  end
  describe '遷移先のテスト' do
    context 'ログインしてないユーザが使ったもの一覧に遷移しようとした場合' do
      it 'トップ画面へ遷移する' do
        visit root_path
        click_on '使ったもの一覧'
        expect(page).to have_content 'show money'
      end
    end
  end
end
