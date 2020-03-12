class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :like_items, through: :likes, source: :item

  validates :email,    presence: true, uniqueness: true
  validates :url,      presence: true, uniqueness: true
  validates :password, presence: true
  # validates :password_confirmation, presence: true

  # validates :name,    presence: true
  # validates :dc,      presence: true
  # validates :server,  presence: true
end
