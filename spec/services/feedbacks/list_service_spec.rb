require 'rails_helper'

RSpec.describe Feedbacks::ListService, 'call' do
  describe 'it returns card feedbacks list' do
    before do
      card = create(:card)
      @response = Feedbacks::ListService.call(card.imt_id)
    end

    it 'test response status and body type' do
      expect(@response.status).to eq(200)
    end

    it 'test response body include fields' do
      expect(@response.body.has_key?('feedbacks')).to be true
      expect(@response.body['feedbacks']).to be_a_kind_of(Array)

      expect(@response.body['feedbacks'].last.has_key?('imtId')).to be true
      expect(@response.body['feedbacks'].last.has_key?('subjectId')).to be true
      expect(@response.body['feedbacks'].last.has_key?('productValuation')).to be true
      expect(@response.body['feedbacks'].last.has_key?('wbUserDetails')).to be true
      expect(@response.body['feedbacks'].last.has_key?('productDetails')).to be true

      expect(@response.body['feedbacks'].last['wbUserDetails'].has_key?('name')).to be true
      expect(@response.body['feedbacks'].last['productDetails'].has_key?('productName')).to be true
    end
  end

  describe "it test empty response" do
    before do
      @response = Feedbacks::ListService.call(12)
    end

    it 'test response with fake card_id' do
      expect(@response.body.has_key?('feedbacks')).to be true
      expect(@response.body['feedbacks']).to be_a_kind_of(Array)
      expect(@response.body['feedbacks']).to be_empty
    end
  end
  

  describe 'it returns card feedbacks list with limits' do
    before do
      card = create(:card)
      @limit = 10
      @response = Feedbacks::ListService.call(card.imt_id, @limit)
    end

    it 'test response with limit' do
      expect(@response.body['feedbacks']).to be_a_kind_of(Array)
      expect(@response.body['feedbacks'].count).to eq(@limit)
    end
  end
end