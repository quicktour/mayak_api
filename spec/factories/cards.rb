FactoryBot.define do
  factory :card do
    imt_id { rand(1111...9999999) }
    product_name { Faker::Commerce.department }
  end
end