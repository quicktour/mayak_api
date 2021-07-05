require 'rails_helper'

RSpec.describe "Api::V1::Cards", type: :request do
  describe "GET /list" do
    it 'returns valid cards response list' do
      create_list(:card, 15)

      get '/api/v1/cards/list'
      expect(response.status).to eq 200
      expect(response).to match_response_schema("cards_list")
    end
  end

  describe "GET /top" do
    it 'returns valid cards top response' do
      create_list(:card, 15)

      get '/api/v1/cards/top'
      expect(response.status).to eq 200
      expect(response).to match_response_schema("cards_top")
    end
  end
end
