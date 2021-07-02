FactoryBot.define do
  factory :card do
    imt_id { rand(111111..999999) }
    product_name { Faker::Commerce.department }
  end
end