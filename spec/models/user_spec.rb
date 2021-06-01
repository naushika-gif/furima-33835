require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  
  describe "ユーザー新規登録" do
    context '新規登録できるとき' do
      it '全ての項目の入力が存在されていれば登録できる' do
        expect(@user).to be_valid
      end
      # it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
      #   @user.password = '000000'
      #   @user.password_confirmation = '000000'
      #   expect(@user).to be_valid
      # end
    end
    context '新規登録できないとき' do
     it 'nicknameが空では登録できない' do
     @user.nickname = ''
     @user.valid?
     expect(@user.errors.full_messages).to include("Nickname can't be blank")
     end

# 【email】
     it 'emailが空では登録できない' do
     @user.email = ''
     @user.valid?
     expect(@user.errors.full_messages).to include("Email can't be blank")
     end
     it '重複したemailは登録できない' do
     @user.save
     another_user = FactoryBot.build(:user)
     another_user.email = @user.email
     another_user.valid?
     expect(another_user.errors.full_messages).to include('Email has already been taken')
     end

# 【password】
    it 'passwordが空では登録できない' do
    @user.password = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordが存在してもpassword_confirmationが空では登録できない' do
    @user.password_confirmation = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'passwordが5文字以下では登録できない' do
    @user.password = '00000'
    @user.password_confirmation = '00000'
    @user.valid?
    expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

# 【name_jap】
    it "first_name_japが空だと登録できない" do
    @user.first_name_jap = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("First name jap can't be blank")
    end
    it "family_name_japが空だと登録できない" do
    @user.family_name_jap = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Family name jap can't be blank")
    end
    it "first_name_japは半角では登録できない" do
    @user.first_name_jap = 'aaa'
    @user.valid?
    expect(@user.errors.full_messages).to include("First name jap 全角文字を使用してください")
    end
    it "family_name_japは半角では登録できない" do
    @user.family_name_jap = 'aaa'
    @user.valid?
    expect(@user.errors.full_messages).to include("Family name jap 全角文字を使用してください")
    end
# 【name_kana】
    it "first_name_kanaが空だと登録できない" do
    @user.first_name_kana = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it "family_name_kanaが空だと登録できない" do
    @user.family_name_kana = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Family name kana can't be blank")
    end
    it "first_name_kanaは半角では登録できない" do
    @user.first_name_kana = 'aaa'
    @user.valid?
    expect(@user.errors.full_messages).to include("First name kana 全角文字を使用してください")
    end
    it "family_name_japは半角では登録できない" do
    @user.family_name_kana = 'aaa'
    @user.valid?
    expect(@user.errors.full_messages).to include("Family name kana 全角文字を使用してください")
    end

    it "birthdayが空だと登録できない" do
    @user.birthday= ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
 end
end


