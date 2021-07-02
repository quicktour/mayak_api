require 'rails_helper'

RSpec.describe Cards::ListService do
  describe 'it returns cards list' do
    it 'test not empty' do 
      create(:card)
      expect( described_class.call ).not_to be_empty
    end

    it 'test service list response' do
      cards = create_list(:card, 5)
      expect( described_class.call.count ).to eq(cards.count) 
    end
  end
end