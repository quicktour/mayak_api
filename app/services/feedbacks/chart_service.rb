class Feedbacks::ChartService < ApplicationService
  def initialize(card_id, range)
    @card_id = card_id
    @range = range
  end

  def call
    response = Feedbacks::ListService.call(@card_id)
    cutted_result = RangeCutterService.call(response.body['feedbacks'], @range)
    build_cart(cutted_result)
  end

  private

  def build_cart(cutted_result)
    pre_result = {}
    cutted_result.each do |item|
      key = DateTime.parse(item['createdDate']).strftime("%b %d")

      if pre_result.has_key?(key)
        pre_result[key] += 1
      else
        pre_result[key] = 1
      end
    end

    result_template(pre_result.keys.map(&:to_s), pre_result.values.map(&:to_i))
  end

  def result_template(labels, data)
    {
      labels: labels,
      data: data
    }
  end
end