class User < ApplicationRecord
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items

  validates :nickname,            presence: true, length: { maximum: 6 }
  validates :last_name_kana,      presence: true,format: {with: /\A[ァ-ヶー－]+\z/}
  validates :first_name_kana,     presence: true,format: {with: /\A[ァ-ヶー－]+\z/}
  validates :birth_date,          presence: true
  
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ } do
    validates :first_name
    validates :last_name
  end
  
  has_many :items
  has_many :purchase_records

end
