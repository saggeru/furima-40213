FactoryBot.define do
  factory :user do
    nickname              { Faker::Internet.username(specifier: 4..6) }
    email                 { Faker::Internet.email }
    password              { "1a" + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    first_name            { Gimei.first.kanji }
    last_name             { Gimei.last.kanji }
    first_kana            { Gimei.first.katakana }
    last_kana             { Gimei.last.katakana }
    birthday              { Faker::Date.between(from: '1930-01-01', to:'2019-12-31') }
  end
end
