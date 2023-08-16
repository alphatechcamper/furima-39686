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
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it 'メールアドレスが空だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it '重複したメールアドレスだと登録できない' do
        post_user = FactoryBot.create(:user)
        @user.email = post_user.email
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールはすでに存在します')
      end
      it 'メールアドレスは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールは不正な値です')
      end
      it 'パスワードが空だと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it 'パスワードが6文字より短いと登録できない' do
        @user.password = 'abcd1'
        @user.password_confirmation = 'abcd1'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end
      it '英字のみのパスワードでは登録できない' do
        @user.password = 'abcdef'
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは半角英数字で入力してください')
      end
      it '数字のみのパスワードでは登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは半角英数字で入力してください')
      end
      it '全角文字を含むパスワードでは登録できない' do
        @user.password = 'Ｂcde1234'
        @user.password_confirmation = 'Ｂcde1234'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは半角英数字で入力してください')
      end
      it 'パスワードとパスワード(確認)が一致しないと登録できない' do
        @user.password = 'abcdef1'
        @user.password_confirmation = 'abcdef2'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it 'お名前(全角)の名字が空だと登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名字を入力してください")
      end
      it 'お名前(全角)の名前が空だと登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前を入力してください")
      end
      it 'お名前(全角)の名字に半角文字が含まれていると登録できない' do
        @user.last_name = '田ﾅｶ'
        @user.valid?
        expect(@user.errors.full_messages).to include('名字は全角で入力してください')
      end
      it 'お名前(全角)の名前に半角文字が含まれていると登録できない' do
        @user.first_name = '太ﾛｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include('名前名字を入力してください')
      end
      it 'お名前カナ(全角)は名字が空だと登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名字(カナ)を入力してください")
      end
      it 'お名前カナ(全角)は名前が空だと登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前(カナ)を入力してください")
      end
      it 'お名前(カナ)の名字にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
        @user.last_name_kana = '田ナカ'
        @user.valid?
        expect(@user.errors.full_messages).to include('名字(カナ)は全角（カナ）で入力してください')
      end
      it 'お名前(カナ)の名前にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
        @user.first_name_kana = '太ロウ'
        @user.valid?
        expect(@user.errors.full_messages).to include('名前(カナ)は全角（カナ）で入力してください')
      end
      it '生年月日が空だと登録できない' do
        @user.user_birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("誕生日を入力してください")
      end
    end
  end
end
