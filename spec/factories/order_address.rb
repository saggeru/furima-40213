FactoryBot.define do
  factory :order_address do
    post_code     { Faker::Address.postcode }
    prefecture_id { rand(2..48) }
    city          { Faker::Address.city }
    address_no    { Faker::Address.street_address }
    building_name { Faker::Address.secondary_address }
    phone_number  { Faker::Number.number(digits: 11) }
    token         { "tok_abcdefghijk00000000000000000" }
  end
end