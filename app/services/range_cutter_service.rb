class RangeCutterService < ApplicationService
  def initialize(data, range)
    @data = data
    @range = range
  end

  def call
    cut_range()
  end
  
  private

  def cut_range
    result = []
    actual_range = (1.public_send(@range).ago.to_date..Date.today)
    @data.each do |item|
      result << item if actual_range.cover?(item['createdDate'].to_date)
    end
    result
  end
end