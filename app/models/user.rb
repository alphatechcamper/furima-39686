class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders

  validates :nickname, presence: true
  validates :password,
            format: { with: /\A(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]+\z/, message: 'は半角英数字で入力してください' }
  validates :first_name, presence: true,
                         format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '名字を入力してください' }
  validates :last_name, presence: true,
                        format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'は全角で入力してください' }
  validates :first_name_kana, presence: true,
                              format: { with: /\A[ァ-ヶ]+\z/, message: 'は全角（カナ）で入力してください' }
  validates :last_name_kana, presence: true,
                             format: { with: /\A[ァ-ヶ]+\z/, message: 'は全角（カナ）で入力してください' }
  validates :user_birth_date, presence: true
end
