require 'json'

class Feedbacks::ListService < ApplicationService
  attr_reader :status
  attr_reader :body

  def initialize(card_id, limit = 0)
    @card_id = card_id
    @limit = limit
  end

  def call
    get_list()
    self
  end

  private

  def get_list
    body = {"skip": 0, "imtId": @card_id, "order": "dateDesc", "take": @limit}
    response = Excon.post("#{ENV.fetch("WB_API_ENDPOINT")}/feedbacks", body: body.to_json)

    @status = response.status
    @body = JSON.parse(response.body)
  end
end