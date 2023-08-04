class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :password,
            format: { with: /\A(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]+\z/, message: 'should be in mixed alphanumeric characters' }
  validates :first_name, presence: true,
                         format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'should be a full-width name' }
  validates :last_name, presence: true,
                        format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'should be a full-width name' }
  validates :first_name_kana, presence: true,
                             format: { with: /\A[ァ-ヶ]+\z/, message: 'should be a full-width katakana name' }
  validates :last_name_kana, presence: true,
                            format: { with: /\A[ァ-ヶ]+\z/, message: 'should be a full-width katakana name' }
  validates :user_birth_date, presence: true
end
