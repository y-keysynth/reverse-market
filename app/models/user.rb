class User < ApplicationRecord
  include ActiveModel::Model
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :like_items, through: :likes, source: :item

  validates :email,   presence: true, uniqueness: true
  validates :url,     presence: true, uniqueness: true

  validates :url, presence: { message: "入力してください" }

  # validates :name,    presence: true
  # validates :dc,      presence: true
  # validates :server,  presence: true
end
