class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :item
  has_many :order


  validates :password, format: { with: /\A(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]+\z/ }
  validates :nickname, presence: true
  validates :birthday, presence: true
  validates :first_name_kanji, presence: true, format: { with: /\p{Han}+/ }
  validates :last_name_kanji, presence: true ,format: { with: /\p{Han}+/ }
  validates :first_name_katakana, presence: true ,format: { with: /\p{katakana}+/ }
  validates :last_name_katakana, presence: true,format: { with: /\p{katakana}+/ }

end
