class Comment < ApplicationRecord
  has_one_attached :image
  belongs_to :spot
  belongs_to :user

  validates :content, presence: true, unless: :was_attached?

  def was_attached?
    image.attached?
  end
end
