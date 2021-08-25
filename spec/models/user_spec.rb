require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:second_user) { FactoryBot.create(:second_user) }
  let(:third_user) { FactoryBot.create(:third_user) }
  describe '親のバリデーションテスト' do
    context '名前、メールアドレス、パスワードが正しい場合' do
      it 'アカウントが作成できる' do
        expect(second_user).to be_valid
      end
    end
    context '名前が空欄の場合' do
      it 'バリデーションエラーになる' do
        second_user.name = nil
        expect(second_user).to be_invalid
      end
    end
    context '名前が31文字以上の場合' do
      it 'バリデーションエラーになる' do
        second_user.name = '工藤' * 26
        expect(second_user).to be_invalid
      end
    end
    context 'メールアドレスが空欄の場合' do
      it 'バリデーションエラーになる' do
        second_user.email = ""
        expect(second_user).to be_invalid
      end
    end
    context 'メールアドレスが256文字以上の場合' do
      it 'バリデーションエラーになる' do
        second_user.email = 'oya@oya.com' * 26
        expect(second_user).to be_invalid
      end
    end
    context 'メールアドレスが重複した場合,' do
      it 'バリデーションエラーになる' do
        User.create!(
          name: '親',
          email: 'oya@oya.com',
          parent_or_child: 0,
          password: '123qwe',
          password_confirmation: '123qwe'
        )
        user = User.new(
          name: '親',
          email: 'oya@oya.com',
          parent_or_child: 0,
          password: '123qwe',
          password_confirmation: '123qwe'
        )
        user.invalid?
        expect(user.errors[:email]).to include('はすでに登録済みなので親子の関係はすでにできています')
      end
    end
    context 'メールアドレスが無効な形式の場合' do
      it 'バリデーションエラーになる' do
        second_user.email = 'aaaaaaa'
        expect(second_user).to be_invalid
      end
    end
    context 'パスワードが未入力の場合' do
      it 'バリデーションエラーになる' do
        second_user.password = nil
        expect(second_user).to be_invalid
      end
    end
    context 'パスワードが6文字以下の場合' do
      it 'バリデーションエラーになる' do
        second_user.password = "hoge"
        expect(second_user).to be_invalid
      end
    end
  end

  describe '子のバリデーションテスト' do
    context '名前、メールアドレス、パスワードが正しい場合' do
      it 'アカウントが作成できる' do
        expect(third_user).to be_valid
      end
    end
    context '名前が空欄の場合' do
      it 'バリデーションエラーになる' do
        third_user.name = nil
        expect(third_user).to be_invalid
      end
    end
    context '名前が31文字以上の場合' do
      it 'バリデーションエラーになる' do
        third_user.name = '工藤' * 26
        expect(third_user).to be_invalid
      end
    end
    context 'メールアドレスが空欄の場合' do
      it 'バリデーションエラーになる' do
        third_user.email = ""
        expect(third_user).to be_invalid
      end
    end
    context 'メールアドレスが256文字以上の場合' do
      it 'バリデーションエラーになる' do
        third_user.email = 'kodomo@kodomo.com' * 26
        expect(third_user).to be_invalid
      end
    end
    context 'メールアドレスが重複した場合,' do
      it 'バリデーションエラーになる' do
        User.create!(
          name: '子',
          email: 'kodomo@kodomo.com',
          parent_or_child: 1,
          password: '123qwe',
          password_confirmation: '123qwe'
        )
        user = User.new(
          name: '子',
          email: 'kodomo@kodomo.com',
          parent_or_child: 1,
          password: '123qwe',
          password_confirmation: '123qwe'
        )
        user.invalid?
        expect(user.errors[:email]).to include('はすでに登録済みなので親子の関係はすでにできています')
      end
    end
    context 'メールアドレスが無効な形式の場合' do
      it 'バリデーションエラーになる' do
        third_user.email = 'aaaaaaa'
        expect(third_user).to be_invalid
      end
    end
    context 'パスワードが未入力の場合' do
      it 'バリデーションエラーになる' do
        third_user.password = nil
        expect(third_user).to be_invalid
      end
    end
    context 'パスワードが6文字以下の場合' do
      it 'バリデーションエラーになる' do
        third_user.password = "hoge"
        expect(third_user).to be_invalid
      end
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
