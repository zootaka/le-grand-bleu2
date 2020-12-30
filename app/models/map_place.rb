class MapPlace < ApplicationRecord
  with_options presence: true do
    validates :place_name
    validates :latitude
    validates :longitude
  end
end
