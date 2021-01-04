class Comment < ApplicationRecord
  has_one_attached :image
  belongs_to :map_place
  belongs_to :user

  validates :content, presence: true, unless: :was_attached?
  validate :image_content_type, if: :was_attached?
  def image_content_type
    errors.add(:image, 'にはjpegまたはpngファイルを添付してください') unless image.content_type.in?(%('image/jpeg image/png'))
  end

  def was_attached?
    image.attached?
  end
end
