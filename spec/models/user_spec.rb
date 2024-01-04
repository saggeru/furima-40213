require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it '項目すべてにデータが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'ニックネームの値が空のとき新規登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'メールアドレスの値が空のとき新規登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it'メールアドレスの値が@を含んでいないとき新規登録できない' do
        @user.email = 'test.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it 'パスワード(確認)の値が不一致では新規登録できない' do
        @user.password = 'a12345'
        @user.password_confirmation = '12345b'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'パスワードの値が英数字混合6文字以上でないと新規登録できない' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it 'パスワードの値が6文字未満のとき新規登録できない' do
        @user.password = '123'
        @user.password_confirmation = '123'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it 'お名前(全角)の値が漢字以外のとき新規登録できない' do
        @user.first_name = 'a'
        @user.last_name = 'b'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end

      it 'お名前カナ(全角)の値が英字のとき新規登録できない' do
        @user.first_kana = 'a'
        @user.last_kana = 'b'
        @user.valid?
        expect(@user.errors.full_messages).to include("First kana is invalid")
      end

      it '生年月日の値が空のとき新規登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end

    end
  end
end
