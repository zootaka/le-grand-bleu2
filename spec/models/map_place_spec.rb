require 'rails_helper'

RSpec.describe MapPlace, type: :model do
  describe '#create' do
    before do
      @map_place = FactoryBot.build(:map_place)
    end

    context '登録がうまくいかない時' do
      it 'place_name,latitude,longitudeが存在すれば登録できること' do
        expect(@map_place).to be_valid
      end
    end

    context '登録がうまくいかない時' do
      it 'place_nameが空では登録できないこと' do
        @map_place.place_name = nil
        @map_place.valid?
        expect(@map_place.errors.full_messages).to include("Place name can't be blank")
      end

      it 'latitudeが空では登録できないこと' do
        @map_place.latitude = nil
        @map_place.valid?
        expect(@map_place.errors.full_messages).to include("Latitude can't be blank")
      end

      it 'longitudeが空では登録できないこと' do
        @map_place.longitude = nil
        @map_place.valid?
        expect(@map_place.errors.full_messages).to include("Longitude can't be blank")
      end
    end
  end
end
