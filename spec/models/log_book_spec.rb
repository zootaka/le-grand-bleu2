require 'rails_helper'

RSpec.describe LogBook, type: :model do
  describe '#create' do
    before do
      @log_book = FactoryBot.build(:log_book)
    end

    context 'ログブック登録がうまくいく時' do
      it '全てのカラムが存在すれば登録できること' do
        expect(@log_book).to be_valid
      end
    end

    context 'ログブック登録がうまくいかない時' do
      it 'placeが空では登録できないこと' do
        @log_book.place = nil
        @log_book.valid?
        expect(@log_book.errors.full_messages).to include("Place can't be blank")
      end
    end
  end
end
