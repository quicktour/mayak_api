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
    pre_result = build_pre_result()
    cutted_result.each do |item|
      key = DateTime.parse(item['createdDate']).strftime("%b %d")
      pre_result[key] += 1
    end

    result_template(pre_result.keys.map(&:to_s), pre_result.values.map(&:to_i))
  end

  def build_pre_result
    (1.public_send(@range).ago.to_date..Date.today).inject({}) do |mem, item| 
      mem[item.strftime("%b %d")] = 0
      mem
    end
  end

  def result_template(labels, data)
    {
      labels: labels,
      data: data
    }
  end
end