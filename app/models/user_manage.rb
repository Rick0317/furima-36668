class UserManage < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :last_name,  presence: true, format: {
    with: /¥nA[ぁ-んァ-ン一-龥]/,
    message: "Last name is invalid. Input full-width characters"
  }
  validates :first_name, presence: true, format: {
    with: /¥nA[ぁ-んァ-ン一-龥]/,
    message: "Last name is invalid. Input full-width characters"
  }
  validates :kana_last_name,  presence: true, format: {
    with: /A¥n[¥np{katakana} ー－&&[^ -~｡-ﾟ]]+¥nz/,
    message: "Last name kana is invalid. Input full-width katakana characters"
  }
  validates :kana_first_name, presence: true, format: {
    with: /A¥n[¥np{katakana} ー－&&[^ -~｡-ﾟ]]+¥nz/,
    message: "Last name kana is invalid. Input full-width katakana characters"
  }
  validates :birthday, presence: true
  
end
