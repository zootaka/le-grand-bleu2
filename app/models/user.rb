class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validate :avatar_content_type, if: :was_attached?

  has_one_attached :avatar
  has_many :log_books
  has_many :comments

  def avatar_content_type
    errors.add(:avatar, 'にはjpegまたはpngファイルを添付してください') unless avatar.content_type.in?(%('image/jpeg image/png'))
  end

  def was_attached?
    avatar.attached?
  end
end
