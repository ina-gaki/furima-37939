require 'rails_helper'
RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it 'nicknameが空だと登録できない' do
      user = User.new(nickname: '', email: 'test@gmail.com', password: '00000000', password_confirmation: '00000000',
                      family_name: '仮', first_name: '太郎', family_name_kana: 'カリ', first_name_kana: 'タロウ', birthday: "'2000/01/01'")
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      user = User.new(nickname: 'test', email: '', password: '00000000', password_confirmation: '00000000',
                      family_name: '仮', first_name: '太郎', family_name_kana: 'カリ', first_name_kana: 'タロウ', birthday: "'2000/01/01'")
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it 'passwordが空では登録できない' do
      user = User.new(nickname: 'test', email: 'test@gmail.com', password: '', password_confirmation: '00000000',
                      family_name: '仮', first_name: '太郎', family_name_kana: 'カリ', first_name_kana: 'タロウ', birthday: "'2000/01/01'")
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank", "Password confirmation doesn't match Password",
                                                   "Encrypted password can't be blank")
    end
    it 'family_nameが空では登録できない' do
      user = User.new(nickname: 'test', email: 'test@gmail.com', password: '00000000', password_confirmation: '00000000',
                      family_name: '', first_name: '太郎', family_name_kana: 'カリ', first_name_kana: 'タロウ', birthday: "'2000/01/01'")
      user.valid?
      expect(user.errors.full_messages).to include("Family name can't be blank")
    end
    it 'first_nameが空では登録できない' do
      user = User.new(nickname: 'test', email: 'test@gmail.com', password: '00000000', password_confirmation: '00000000',
                      family_name: '仮', first_name: '', family_name_kana: 'カリ', first_name_kana: 'タロウ', birthday: "'2000/01/01'")
      user.valid?
      expect(user.errors.full_messages).to include("First name can't be blank")
    end
    it 'family_name_kanaが空では登録できない' do
      user = User.new(nickname: 'test', email: 'test@gmail.com', password: '00000000', password_confirmation: '00000000',
                      family_name: '仮', first_name: '太郎', family_name_kana: '', first_name_kana: 'タロウ', birthday: "'2000/01/01'")
      user.valid?
      expect(user.errors.full_messages).to include("Family name kana can't be blank")
    end
    it 'first_name_kanaが空では登録できない' do
      user = User.new(nickname: 'test', email: 'test@gmail.com', password: '00000000', password_confirmation: '00000000',
                      family_name: '仮', first_name: '太郎', family_name_kana: 'カリ', first_name_kana: '', birthday: "'2000/01/01'")
      user.valid?
      expect(user.errors.full_messages).to include("First name kana can't be blank")
    end
    it 'birthdayが空では登録できない' do
      user = User.new(nickname: 'test', email: 'test@gmail.com', password: '00000000', password_confirmation: '00000000',
                      family_name: '仮', first_name: '太郎', family_name_kana: 'カリ', first_name_kana: 'タロウ', birthday: '')
      user.valid?
      expect(user.errors.full_messages).to include("Birthday can't be blank")
    end
    it 'first_nameが全角（漢字・ひらがな・カタカナ）以外では登録できない' do
      user = User.new(nickname: 'test', email: 'test@gmail.com', password: '00000000', password_confirmation: '00000000',
                      family_name: '仮', first_name: 'ﾀﾛｳ', family_name_kana: 'カリ', first_name_kana: 'タロウ', birthday: "'2000/01/01'")
      user.valid?
      expect(user.errors.full_messages).to include('First name is invalid')
    end
    it 'family_nameが全角（漢字・ひらがな・カタカナ）以外では登録できない' do
      user = User.new(nickname: 'test', email: 'test@gmail.com', password: '00000000', password_confirmation: '00000000',
                      family_name: 'ｶﾘ', first_name: '太郎', family_name_kana: 'カリ', first_name_kana: 'タロウ', birthday: "'2000/01/01'")
      user.valid?
      expect(user.errors.full_messages).to include('Family name is invalid')
    end
    it 'first_name_kanaが全角（カタカナ）以外では登録できない' do
      user = User.new(nickname: 'test', email: 'test@gmail.com', password: '00000000', password_confirmation: '00000000',
                      family_name: '仮', first_name: '太郎', family_name_kana: 'カリ', first_name_kana: '太郎', birthday: "'2000/01/01'")
      user.valid?
      expect(user.errors.full_messages).to include('First name kana is invalid')
    end
    it 'family_name_kanaが全角（カタカナ）以外では登録できない' do
      user = User.new(nickname: 'test', email: 'test@gmail.com', password: '00000000', password_confirmation: '00000000',
                      family_name: '仮', first_name: '太郎', family_name_kana: '仮', first_name_kana: 'タロウ', birthday: "'2000/01/01'")
      user.valid?
      expect(user.errors.full_messages).to include('Family name kana is invalid')
    end
  end
end
