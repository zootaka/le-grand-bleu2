require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe '#create' do
    before do
      @comment = FactoryBot.build(:comment)
    end

    it 'contentとimageが存在していれば保存できること' do
      expect(@comment).to be_valid
    end

    it 'imageが空でも保存できること' do
      @comment.image = nil
      expect(@comment).to be_valid
    end

    it 'contentとimageが空では保存できないこと' do
      @comment.content = nil
      @comment.image = nil
      @comment.valid?
      expect(@comment.errors.full_messages).to include("Content can't be blank")
    end

    it 'roomが紐付いていないと保存できないこと' do
      @comment.map_place = nil
      @comment.valid?
      expect(@comment.errors.full_messages).to include('Map place must exist')
    end

    it 'userが紐付いていないと保存できないこと' do
      @comment.user = nil
      @comment.valid?
      expect(@comment.errors.full_messages).to include('User must exist')
    end
  end
end
