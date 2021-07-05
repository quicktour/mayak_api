require 'rails_helper'

RSpec.describe "Api::V1::Feedbacks", type: :request do
  describe "GET /chart" do
    it 'returns valid feedbacks chart response' do
      card = create(:card)

      get "/api/v1/feedbacks/#{card.imt_id}/chart"
      expect(response.status).to eq 200
      expect(response).to match_response_schema("feedbacks_top")
    end
  end
end
