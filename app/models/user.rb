class User < ApplicationRecord
  # 属性の値がDBに保存されても良いかチェックを行う条件
 has_many :products
 has_many :purchases

  with_options presence: true do
    validates :nickname
    validates :birthday
    
  with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' } do
      validates :first_name_jap
      validates :family_name_jap
  end
    
  with_options  format: { with: /\A[ァ-ヶー－]+\z/, message: '全角カナ文字を使用してください' } do
      validates :first_name_kana
      validates :family_name_kana
  end
  
  with_options format: { with: /\A[a-z0-9]+\z/i, message: '半角英数字を使用してください' } do
      validates :password
  end
end
    
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
        # validatebleにおける自動バリデーション設定の範囲 (Email): email→存在すること/一意性であること/@を含むこと
        # validatableにおける自動バリデーション設定の範囲 (password): password→存在すること/6文字以上128文字以下であること

 PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'
end
