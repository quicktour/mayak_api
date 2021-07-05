require 'rails_helper'

RSpec.describe Cards::TopService do
  describe 'it returns top limit cards' do
    before do
      cards = create_list(:card, 100)
      range = :week
      @limit = 10
      @result = Cards::TopService.call(cards, @limit, range)
    end

    it 'test valid result' do
      expect(@result).to be_a_kind_of(Array)
      expect(@result.last).to be_a_kind_of(Hash)
      expect(@result.last.has_key?('imt_id')).to be true
      expect(@result.last.has_key?('total_comments')).to be true
    end

    it 'test valid limit count' do
      expect(@result.count).to eq(@limit)
    end
  end
end