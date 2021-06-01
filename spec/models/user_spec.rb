require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    it "nicknameが空では登録できない" do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空では登録できない" do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
  end
end

    # it "passwordが空だと登録できない" do
    #   user.password = ''
    #   user.valid?
    #   binding.pry
    #   expect(user.errors.full_messages).to include("Password can't be blank")
    # end
    # it "encrypted_passwordが空だと登録できない" do
    #   user = FactoryBot.build(:user)
    #   user.encrypted_password= ''
    #   user.valid?
    #   expect(user.errors.full_messages).to include("Password can't be blank")
    # end
    # it "family_name_japが空だと登録できない" do
    #   user = FactoryBot.build(:user)
    #   user.family_name_jap = ''
    #   user.valid?
    #   binding.pry
    #   expect(user.errors.full_messages).to include("Family_name_jap can't be blank")
    # end

    # it "family_name_kanaが空だと登録できない" do
    #   user = FactoryBot.build(:user)
    #   user.family_name_kana= ''
    #   user.valid?
    #   expect(user.errors.full_messages).to include("Family_name_kana can't be blank")
    # end
    # it "first_name_japが空だと登録できない" do
    #   user = FactoryBot.build(:user)
    #   user.first_name_jap = ''
    #   user.valid?
    #   expect(user.errors.full_messages).to include("First_name_jap can't be blank")
    # end
    # it "first_name_kanaが空だと登録できない" do
    #   user = FactoryBot.build(:user)
    #   user.first_name_kana = ''
    #   user.valid?
    #   expect(user.errors.full_messages).to include("First_name_kana can't be blank")
    # end
    # it "birthdayが空だと登録できない" do
    #   user = FactoryBot.build(:user)
    #   user.birthday= ''
    #   user.valid?
    #   expect(user.errors.full_messages).to include("Birthday can't be blank")
    # end
