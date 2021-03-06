require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe '新規登録' do
    context '新規登録できる時' do
      it 'nickname, email, password, password_confirmation, last_name, first_name, kana_last_name, kana_first_name, birthdayが存在すれば新規登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できない時' do
      it 'メールアドレスが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'メールアドレスが重複していると登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'メールアドレスに@がないと登録できない' do
        @user.email = 'furima.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'パスワードが空だと登録できない' do
        @user.password = ''
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'パスワードが6文字以下だと登録できない' do
        @user.password = 'abc12'
        @user.password_confirmation = 'abc12'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'パスワードとその確認が一致していないと登録できない' do
        @user = FactoryBot.build(:user)
        @user.password_confirmation = 'abcdefg12'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'ニックネームがないと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'パスワードが半角数字のみの場合は登録できない' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid. Include both letters and numbers')
      end
      it 'パスワードが半角英字のみの場合は登録できない' do
        @user.password = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid. Include both letters and numbers')
      end
      it 'パスワードは全角文字では登録できない' do
        @user.password = 'こんにちは'
        @user.password_confirmation = 'こんにちは'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid. Include both letters and numbers')
      end
      it 'パスワードとその確認が一致していないと登録できない' do
        @user.password = 'abcde12'
        @user.password_confirmation = '12abcde'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password") 
      end
      it 'お名前（全角）苗字が空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank") 
      end
      it 'お名前（全角）名前が空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'お名前（全角）苗字が全角（漢字・ひらがな・カタカナ）でないと登録できない' do
        @user.last_name = 're'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid. Input full-width characters')
      end
      it 'お名前（全角）名前が全角（漢字・ひらがな・カタカナ）でないと登録できない' do
        @user.first_name = 're'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid. Input full-width characters')
      end
      it 'お名前カナ（全角）苗字が空だと登録できない' do
        @user.kana_last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana last name is invalid. Input full-width katakana characters')
      end
      it 'お名前カナ（全角）名前が空だと登録できない' do
        @user.kana_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana first name is invalid. Input full-width katakana characters')
      end
      it 'お名前カナ（全角）苗字が全角カタカナでないと登録できない' do
        @user.kana_last_name = 're'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana last name is invalid. Input full-width katakana characters')
      end
      it 'お名前カナ（全角）苗字が全角カタカナでないと登録できない' do
        @user.kana_first_name = 're'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana first name is invalid. Input full-width katakana characters')
      end
      it '生年月日が空だと登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
