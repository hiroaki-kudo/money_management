require 'rails_helper'
RSpec.describe 'お金のメモ', type: :system do
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
        select '②:食べ物・飲み物'
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
        select '②:食べ物・飲み物'
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
        select '②:食べ物・飲み物'
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
        select '②:食べ物・飲み物'
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


  #
  # describe '一覧表示機能' do
  #   context '一覧画面に遷移した場合' do
  #     it '作成済みのタスク一覧が表示される' do
  #       visit new_session_path
  #       fill_in 'Email', with: 'kudou@kudou.com'
  #       fill_in 'Password', with: 'kudoukudou'
  #       click_button 'commit'
  #       click_on 'タスク一覧画面へ'
  #       expect(page).to have_content 'Factoryで作ったデフォルトのタイトル２'
  #     end
  #   end
  #   context 'タスクが作成日時の降順に並んでいる場合' do
  #     it '新しいタスクが一番上に表示される' do
  #       visit new_session_path
  #       fill_in 'Email', with: 'kudou@kudou.com'
  #       fill_in 'Password', with: 'kudoukudou'
  #       click_button 'commit'
  #       click_on 'タスク一覧画面へ'
  #       click_on 'タスクの新規作成'
  #       fill_in 'task[name]', with: '勉強'
  #       fill_in 'task[detail]', with: 'プログラミング'
  #       fill_in 'task[end_date]', with: '002025-07-01'
  #       select '未着手'
  #       select '低'
  #       click_button 'commit'
  #       click_on 'タスクの新規作成'
  #       fill_in 'task[name]', with: '遊び'
  #       fill_in 'task[detail]', with: 'ゲーム'
  #       fill_in 'task[end_date]', with: '002025-04-01'
  #       select '完了'
  #       select '高'
  #       click_button 'commit'
  #       task_list = all('.task_row')
  #       expect(task_list[0]).to have_content '遊び'
  #       expect(task_list[1]).to have_content '勉強'
  #       expect(task_list[2]).to have_content 'Factoryで作ったデフォルトのタイトル２'
  #     end
  #   end
  #   context 'タスクが終了期限の降順に並んでいる場合' do
  #     it '新しいタスクの終了期限が最長だった時は一番上に表示される' do
  #       visit new_session_path
  #       fill_in 'Email', with: 'kudou@kudou.com'
  #       fill_in 'Password', with: 'kudoukudou'
  #       click_button 'commit'
  #       click_on 'タスク一覧画面へ'
  #       click_on 'タスクの新規作成'
  #       fill_in 'task[name]', with: '勉強'
  #       fill_in 'task[detail]', with: 'プログラミング'
  #       fill_in 'task[end_date]', with: '002025-07-01'
  #       select '未着手'
  #       select '低'
  #       click_button 'commit'
  #       click_on 'タスクの新規作成'
  #       fill_in 'task[name]', with: '遊び'
  #       fill_in 'task[detail]', with: 'ゲーム'
  #       fill_in 'task[end_date]', with: '002025-04-01'
  #       select '完了'
  #       select '高'
  #       click_button 'commit'
  #       click_on '終了期限でソートする'
  #       task_list = all('.task_row')
  #       sleep 1.0
  #       expect(task_list[0]).to have_content '2025-07-01'
  #       expect(task_list[1]).to have_content '2025-04-01'
  #       expect(task_list[2]).to have_content '2021-07-05'
  #     end
  #   end
  #   context '一覧画面の優先順位でソートのボタンを押した場合' do
  #     it 'タスクが優先順位の高い順に並び替えられる' do
  #       visit new_session_path
  #       fill_in 'Email', with: 'kudou@kudou.com'
  #       fill_in 'Password', with: 'kudoukudou'
  #       click_button 'commit'
  #       click_on 'タスク一覧画面へ'
  #       click_on 'タスクの新規作成'
  #       fill_in 'task[name]', with: '勉強'
  #       fill_in 'task[detail]', with: 'プログラミング'
  #       fill_in 'task[end_date]', with: '002025-07-01'
  #       select '未着手'
  #       select '低'
  #       click_button 'commit'
  #       click_on 'タスクの新規作成'
  #       fill_in 'task[name]', with: '遊び'
  #       fill_in 'task[detail]', with: 'ゲーム'
  #       fill_in 'task[end_date]', with: '002025-04-01'
  #       select '完了'
  #       select '高'
  #       click_button 'commit'
  #       click_on '優先順位でソートする'
  #       task_list = all('.task_row')
  #       sleep 1.0
  #       expect(task_list[0]).to have_content '高'
  #       expect(task_list[1]).to have_content '中'
  #       expect(task_list[2]).to have_content '低'
  #     end
  #   end
  # end
  #
  # describe '詳細表示機能' do
  #    context '任意のタスク詳細画面に遷移した場合' do
  #      it '該当タスクの内容が表示される' do
  #        visit new_session_path
  #        fill_in 'Email', with: 'kudou@kudou.com'
  #        fill_in 'Password', with: 'kudoukudou'
  #        click_button 'commit'
  #        click_on 'タスク一覧画面へ'
  #        click_on 'タスクの新規作成'
  #        fill_in 'task[name]', with: '勉強'
  #        fill_in 'task[detail]', with: 'プログラミング'
  #        fill_in 'task[end_date]', with: '002025-07-01'
  #        select '未着手'
  #        select '低'
  #        click_button 'commit'
  #        task = Task.find_by(name: '勉強')
  #        click_link '詳細', href: task_path(task.id)
  #        expect(page).to have_content '勉強'
  #        expect(page).not_to have_content 'Factoryで作ったデフォルトのタイトル２'
  #      end
  #    end
  # end
  #
  # describe '検索機能' do
  #   context 'タイトルであいまい検索をした場合' do
  #     it "検索キーワードを含むタスクで絞り込まれる" do
  #       visit new_session_path
  #       fill_in 'Email', with: 'kudou@kudou.com'
  #       fill_in 'Password', with: 'kudoukudou'
  #       click_button 'commit'
  #       click_on 'タスク一覧画面へ'
  #       click_on 'タスクの新規作成'
  #       fill_in 'task[name]', with: '勉強'
  #       fill_in 'task[detail]', with: 'プログラミング'
  #       fill_in 'task[end_date]', with: '002025-07-01'
  #       select '未着手'
  #       select '低'
  #       click_button 'commit'
  #       click_on 'タスクの新規作成'
  #       fill_in 'task[name]', with: '遊び'
  #       fill_in 'task[detail]', with: 'ゲーム'
  #       fill_in 'task[end_date]', with: '002025-04-01'
  #       select '完了'
  #       select '高'
  #       click_button 'commit'
  #       # タスクの検索欄に検索ワードを入力する (例: task)
  #       fill_in 'search', with: '勉'
  #       # 検索ボタンを押す
  #       click_on '検索'
  #       expect(page).to have_content '勉強'
  #     end
  #   end
  #   context 'ステータス検索をした場合' do
  #     it "ステータスに完全一致するタスクが絞り込まれる" do
  #       visit new_session_path
  #       fill_in 'Email', with: 'kudou@kudou.com'
  #       fill_in 'Password', with: 'kudoukudou'
  #       click_button 'commit'
  #       click_on 'タスク一覧画面へ'
  #       click_on 'タスクの新規作成'
  #       fill_in 'task[name]', with: '勉強'
  #       fill_in 'task[detail]', with: 'プログラミング'
  #       fill_in 'task[end_date]', with: '002025-07-01'
  #       select '未着手'
  #       select '低'
  #       click_button 'commit'
  #       click_on 'タスクの新規作成'
  #       fill_in 'task[name]', with: '遊び'
  #       fill_in 'task[detail]', with: 'ゲーム'
  #       fill_in 'task[end_date]', with: '002025-04-01'
  #       select '完了'
  #       select '高'
  #       click_button 'commit'
  #       # プルダウンを選択する「select」について調べてみること
  #       select '完了'
  #       click_on '検索'
  #       expect(page).to have_content '完了'
  #     end
  #   end
  #   context 'タイトルのあいまい検索とステータス検索をした場合' do
  #     it "検索キーワードをタイトルに含み、かつステータスに完全一致するタスク絞り込まれる" do
  #       visit new_session_path
  #       fill_in 'Email', with: 'kudou@kudou.com'
  #       fill_in 'Password', with: 'kudoukudou'
  #       click_button 'commit'
  #       click_on 'タスク一覧画面へ'
  #       click_on 'タスクの新規作成'
  #       fill_in 'task[name]', with: '勉強'
  #       fill_in 'task[detail]', with: 'プログラミング'
  #       fill_in 'task[end_date]', with: '002025-07-01'
  #       select '未着手'
  #       select '低'
  #       click_button 'commit'
  #       click_on 'タスクの新規作成'
  #       fill_in 'task[name]', with: '遊び'
  #       fill_in 'task[detail]', with: 'ゲーム'
  #       fill_in 'task[end_date]', with: '002025-04-01'
  #       select '完了'
  #       select '高'
  #       click_button 'commit'
  #       fill_in 'search', with: '勉'
  #       select '未着手'
  #       click_on '検索'
  #       expect(page).to have_content '勉強'
  #       expect(page).to have_content 'プログラミング'
  #     end
  #   end
  # end


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
        select '②:食べ物・飲み物'
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
    context '子がコメントを編集した場合' do
      it '編集したコメントした内容が詳細画面に表示される' do
        visit new_session_path
        fill_in 'Email', with: 'kodomo@kodomo.com'
        fill_in 'Password', with: '123qwe'
        click_button 'commit'
        click_on '使ったもの一覧'
        click_on '使った物などを登録'
        fill_in 'treasurer[use_date_at]', with: '002025-07-01'
        select '②:食べ物・飲み物'
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
        click_on 'コメント編集'
        fill_in 'comment[content]', with: 'まずかった'
        click_button 'commit'
        expect(page).to have_content 'まずかった'
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
        select '②:食べ物・飲み物'
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
    context '親がコメントを編集した場合' do
      it '編集したコメントした内容が詳細画面に表示される' do
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
        click_on 'コメント編集'
        fill_in 'comment[content]', with: '珍しい物買ってきたわね'
        click_button 'commit'
        expect(page).to have_content '珍しい物買ってきたわね'
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
        select '②:食べ物・飲み物'
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
