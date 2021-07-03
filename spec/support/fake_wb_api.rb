require 'json'
require 'faker'
require 'byebug'

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
      limit.times { result << body_template(imtId) }
      result
    end

    def body_template(imtId)
      {
        "imtId": imtId,
        "subjectId": rand(10..400),
        "text": Faker::Lorem.sentence,
        "productValuation": rand(1..5),
        "wbUserDetails": {
          "name": Faker::Name.name
        },
        "productDetails": {
          "productName": Faker::Commerce.department
        }
      }
    end

    def get_params(env)
      request = Rack::Request.new(env)
      JSON.parse(request.body.read)
    end
  end
end