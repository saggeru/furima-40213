image_path = Rails.root.join('public', 'images', 'cat-178857.jpg')

FactoryBot.define do
  factory :item do
    image                   { Rack::Test::UploadedFile.new(image_path, 'image/jpeg') }
    item_name               { Faker::Lorem.word }
    about_item              { Faker::Lorem.word }
    category_id             { rand(2..11) }
    condition_id            { rand(2..7) }
    shipping_fee_payment_id { rand(2..3) }
    prefecture_id           { rand(2..48) }
    shipping_day_id         { rand(2..4) }
    price                   { Faker::Number.within(range: 300..9_999_999) }
    
    association :user
  end
end