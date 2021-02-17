class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :buys

  with_options presence: true do
    validates :nickname
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze, message: 'には半角英数字混合での入力をしてください' }
    validates :last_name,
              format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/, message: 'には全角（漢字・ひらがな・カタカナ）での入力をしてください' }
    validates :first_name,
              format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/, message: 'には全角（漢字・ひらがな・カタカナ）での入力をしてください' }
    validates :last_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'には全角（カタカナ）での入力をしてください' }
    validates :first_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'には全角（カタカナ）での入力をしてください' }
    validates :birthday
  end
end
