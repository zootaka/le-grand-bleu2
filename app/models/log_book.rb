class LogBook < ApplicationRecord
  validates :place, presence: true

  belongs_to :user
end
