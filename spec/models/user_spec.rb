require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it '全て正しく入力していたら登録できる（正常系テスト）' do
      @user = FactoryBot.build(:user)
      expect(@user).to be_valid
    end
    it 'nicknameが空だと登録できない' do
      @user.nickname = '' 
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      @user.email = '' 
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'passwordが空では登録できない' do
      @user.password = '' 
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'family_nameが空では登録できない' do
      @user.family_name = '' 
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank")
    end
    it 'first_nameが空では登録できない' do
      @user.first_name = '' 
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it 'family_name_kanaが空では登録できない' do
      @user.family_name_kana = '' 
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana can't be blank")
    end
    it 'first_name_kanaが空では登録できない' do
      @user.first_name_kana = '' 
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it 'birthdayが空では登録できない' do
      @user.birthday = '' 
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
    it 'first_nameが全角（漢字・ひらがな・カタカナ）以外では登録できない' do
      @user.first_name = 'ﾀﾛｳ' 
      @user.valid?
      expect(@user.errors.full_messages).to include('First name is invalid')
    end
    it 'family_nameが全角（漢字・ひらがな・カタカナ）以外では登録できない' do
      @user.family_name = 'ｶﾘ' 
      @user.valid?
      expect(@user.errors.full_messages).to include('Family name is invalid')
    end
    it 'first_name_kanaが全角（カタカナ）以外では登録できない' do
      @user.first_name_kana = '太朗' 
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana is invalid')
    end
    it 'family_name_kanaが全角（カタカナ）以外では登録できない' do
      @user.family_name_kana = '仮' 
      @user.valid?
      expect(@user.errors.full_messages).to include('Family name kana is invalid')
    end
    it 'emailは@を含まないと登録できない' do
      @user.email = 'testmail' 
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it '重複したemailが存在する場合は登録できない' do    
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'passwordは6文字以上でないと登録できない' do
      @user.password = '12345'
      @user.password_confirmation = '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it 'passwordは半角英語のみでは登録できない' do
      @user.password = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it 'passwordは半角数字のみでは登録できない' do
      @user.password = '111111'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it 'passwordは全角では登録できない' do
      @user.password = 'ｔｅｓｔ１１'
      @user.password_confirmation = 'ｔｅｓｔ１１'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
  end
end
