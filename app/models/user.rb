class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence: true 
  validates :birthday, presence: true
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'Last name is invalid. Input full-width characters' } do
    validates :last_name
  end
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'First name is invalid. Input full-width characters' } do
    validates :first_name
  end
  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'Last name kana is invalid. Input full-width katakana characters' } do
    validates :kana_last_name
  end
  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'First name kana is invalid. Input full-width katakana characters' } do
    validates :kana_first_name
  end
  with_options presence: true, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: 'Password is invalid. Include both letters and numbers' } do
    validates :password
  end

end
