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
  # validates :password, presence: true
  # validates :password_confirmation, presence: true

  # validates :name,    presence: true
  # validates :dc,      presence: true
  # validates :server,  presence: true

  def self.guest
    # find_or_create_by!(email: 'test1@test.com') do |user| # 開発環境
      find_or_create_by!(email: 'guest@guest.com') do |user| # 本番環境
      user.password = SecureRandom.urlsafe_base64
    end
  end

end
