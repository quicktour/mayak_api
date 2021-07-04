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
      create_date = DateTime.current
      rand(100..1000).times do |index|
        create_date = generate_date(index, create_date)
        result << body_template(imtId, product_name, create_date)
      end
      return result if limit.zero?
      
      result.first(limit)
    end

    def body_template(imtId, product_name, create_date)
      {
        "imtId": imtId,
        "subjectId": rand(10..400),
        "text": Faker::Lorem.sentence,
        "productValuation": rand(1..5),
        "createdDate": create_date.strftime('%Y-%m-%dT%H:%M:%SZ'),
        "wbUserDetails": {
          "name": Faker::Name.name
        },
        "productDetails": {
          "productName": product_name
        }
      }
    end

    def generate_date(index, date)
      date -= (index + rand(10..50)).minutes

      if date_is_valid?(date.strftime('%Y-%m-%d'))
        return date
      else
        generate_date(index, (date - 1.day))
      end
    end

    def date_is_valid?(date)
      DateTime.parse date
      return true
    rescue Date::Error
      return false
    end

    def get_params(env)
      request = Rack::Request.new(env)
      JSON.parse(request.body.read)
    end
  end
end