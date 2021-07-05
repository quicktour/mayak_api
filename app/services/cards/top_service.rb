class Cards::TopService < ApplicationService
  def initialize(limit, range)
    @limit = limit
    @range = range
  end

  def call
    generate_top_result()
  end

  private

  def generate_top_result
    build_response.sort_by { |el| -el[:total_comments] }.first(10)
  end

  def build_response
    result = []
    Card.find_in_batches do |cards|
      cards.each do |el|
        imt_id = el.imt_id
        total_response = Feedbacks::ListService.call(el.imt_id).body['feedbacks']
        total_comments = RangeCutterService.call(total_response, :week).count
        result << result_template(imt_id, total_comments)
      end
    end
    result
  end

  def result_template(imt_id, total_comments)
    {
      imt_id: imt_id,
      total_comments: total_comments
    }
  end
end