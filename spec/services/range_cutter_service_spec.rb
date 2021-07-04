require 'rails_helper'

RSpec.describe RangeCutterService, 'call' do
  describe "check response range cut" do
    before do
      card = create(:card)
      @response = Feedbacks::ListService.call(card.imt_id)
    end

    it 'test week range cut' do
      result = RangeCutterService.call(@response.body['feedbacks'], :week)
      dates_array = result.map { |item| item['createdDate'] }
      dates_array.each do |date|
        expect(1.week.ago.to_date..Date.today).to cover(date.to_date)
      end
    end

    it 'test month range cut' do
      result = RangeCutterService.call(@response.body['feedbacks'], :month)
      dates_array = result.map { |item| item['createdDate'] }

      dates_array.each do |date|
        expect(1.month.ago.to_date..Date.today).to cover(date.to_date)
      end
    end
  end
end