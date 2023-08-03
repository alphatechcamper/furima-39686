require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe '新規登録(ユーザー情報)' do
    context '新規登録ができる場合' do
      it '必要な項目が記入されていれば新規登録ができる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録ができない場合' do
      it 'ニックネームが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'メールアドレスが空だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したメールアドレスだと登録できない' do
        post_user = FactoryBot.create(:user)
        @user.email = post_user.email
        @user.valid?
        expect(@user.errors.full_messages).to include('Email has already been taken')
      end
      it 'メールアドレスは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'パスワードが空だと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'パスワードが6文字より短いと登録できない' do
        @user.password = 'abcd1'
        @user.password_confirmation = 'abcd1'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it '英字のみのパスワードでは登録できない' do
        @user.password = 'abcdef'
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password should be in mixed alphanumeric characters')
      end
      it '数字のみのパスワードでは登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password should be in mixed alphanumeric characters')
      end
      it '全角文字を含むパスワードでは登録できない' do
        @user.password = 'Ｂcde1234'
        @user.password_confirmation = 'Ｂcde1234'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password should be in mixed alphanumeric characters')
      end
      it 'パスワードとパスワード(確認)が一致しないと登録できない' do
        @user.password = 'abcdef1'
        @user.password_confirmation = 'abcdef2'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'お名前(全角)の名字が空だと登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'お名前(全角)の名前が空だと登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'お名前(全角)の名字に半角文字が含まれていると登録できない' do
        @user.last_name = '田ﾅｶ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name should be a full-width name')
      end
      it 'お名前(全角)の名前に半角文字が含まれていると登録できない' do
        @user.first_name = '太ﾛｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name should be a full-width name')
      end
      it 'お名前カナ(全角)は名字が空だと登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it 'お名前カナ(全角)は名前が空だと登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it 'お名前(カナ)の名字にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
        @user.last_name_kana = '田ナカ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana should be a full-width katakana name')
      end
      it 'お名前(カナ)の名前にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
        @user.first_name_kana = '太ロウ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana should be a full-width katakana name')
      end
      it '生年月日が空だと登録できない' do
        @user.user_birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("User birth date can't be blank")
      end
    end
  end
end
