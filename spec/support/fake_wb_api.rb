require 'json'
require 'faker'
require 'byebug'
require 'active_support/time'

class FakeWbApi
  class << self 
    def call(env)
      [200, {'Content-Type' => 'application/json'}, [body(env)]]
    end

    private

    def body(env)
      params = get_params(env)
      limit = params['take']
      imtId = params['imtId']

      if imtId.to_s.length > 3
        { "feedbacks": build_body(imtId.to_i, limit.to_i) }.to_json
      else
        { "feedbacks": [] }.to_json
      end
    end

    def build_body(imtId, limit)
      result = []
      product_name = Faker::Commerce.department
      rand(100..1000).times do |index|
        result << body_template(imtId, product_name, index)
      end
      return result if limit.zero?
      
      result.first(limit)
    end

    def body_template(imtId, product_name, index)
      {
        "imtId": imtId,
        "subjectId": rand(10..400),
        "text": Faker::Lorem.sentence,
        "productValuation": rand(1..5),
        "createdDate": (Time.now - (index * rand(1..15)).hour).strftime('%Y-%d-%mT%H:%M:%SZ'),
        "wbUserDetails": {
          "name": Faker::Name.name
        },
        "productDetails": {
          "productName": product_name
        }
      }
    end

    def get_params(env)
      request = Rack::Request.new(env)
      JSON.parse(request.body.read)
    end
  end
end