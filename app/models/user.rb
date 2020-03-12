class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :like_items, through: :likes, source: :item

  validates :email,   presence: true, uniqueness: true
  # validates :url,     presence: true, uniqueness: true

  # DBに保存されないデータのバリデーション
  attr_accessor :url
  validates :url, presence: { message: "が入力されていません。" }, uniqueness: true

  # validates :name,    presence: true
  # validates :dc,      presence: true
  # validates :server,  presence: true
end
