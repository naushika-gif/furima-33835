class User < ApplicationRecord
  validates :nickname, presence: true
  validates :first_name_jap, presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :family_name_jap, presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :first_name_kana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/ }
  validates :family_name_kana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/ }
  validates :birthday, presence: true
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

 PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'
end
