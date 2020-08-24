class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable
  validates :nickname,:first_name,:last_name,:first_name_kana,:last_name_kana,:birthday, presence: true
  devise :validatable, password_length: 7..128
  has_one :address
  has_one :card, dependent: :destroy
  has_many :items
end
