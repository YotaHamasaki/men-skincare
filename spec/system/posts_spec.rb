require 'rails_helper'

describe '投稿機能' , type: :system do
    describe 'ユーザー投稿機能' do
        let(:user_a) { FactoryBot.create(:user, name: 'ユーザーA', email: 'a@example.com') }
        let(:user_b) { FactoryBot.create(:user, name: 'ユーザーB', email: 'b@example.com') }
       
       before do 
           FactoryBot.create(:post, rate: '5.0', title: 'グッドです', content: "また買います", user: user_a)
           
          visit login_path
          fill_in 'メールアドレス', with: login_user.path
          fill_in 'パスワード', with: login_user.password
          click_button 'ログイン'   
       end
       
    context 'ユーザーAがログインしている時' do
        let(:login_user) { user_a }
        
        it 'ユーザーAの投稿が表示される' do
            expect(page).to have_content 'グッドです'
        end
    end
    
    context 'ユーザーBがログインしている時' do
        let(:login_user) { user_b }

        it 'ユーザーAが投稿した内容が表示されない' do
       expect(page).to have_no_content 'グッドです'
    end
  end
 end
end

