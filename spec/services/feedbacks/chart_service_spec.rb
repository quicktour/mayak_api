require 'rails_helper'

RSpec.describe Feedbacks::ChartService, 'call' do
  describe "it returns valid result" do
    before do
      @card = create(:card)
      @result = Feedbacks::ChartService.call(@card.imt_id, :week)
    end

    it 'test return data has valid kind' do
      expect(@result).to be_a_kind_of(Hash)
    end    

    it 'test valid keys in return data' do
      expect(result.last.has_key?('labels')).to be true
      expect(result.last.has_key?('data')).to be true
    end

    it 'test return data has valid kind in keys' do
      expect(result['labels']).to be_a_kind_of(Array)
      expect(result['data']).to be_a_kind_of(Array)
    end

    it 'test return data has same count in keys' do
      expect(result['labels'].count).to eq(result['data'].count)
    end
  end
  
  describe 'it returns card feedbacks chart data in range' do
    before do
      @card = create(:card)
    end

    it 'test return data in week range' do
      result = Feedbacks::ChartService.call(@card.imt_id, :week)
      week_range = (Date.today..1.week.ago.to_date).map{ |date| date.strftime("%b %d") }

      expect(result['labels']).to eq(week_range)
    end

    it 'test return data in month range' do
      result = Feedbacks::ChartService.call(@card.imt_id, :month)
      month_range = (Date.today..1.month.ago.to_date).map{ |date| date.strftime("%b %d") }

      expect(result['labels']).to eq(month_range)
    end
  end
end