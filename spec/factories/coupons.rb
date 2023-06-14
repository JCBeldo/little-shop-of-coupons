FactoryBot.define do
  factory :coupon do
    name { Faker::Alphanumeric.alphanumeric(number: 7, min_alpha: 5, min_numeric: 2) }
    unique_code { Faker::Alphanumeric.alphanumeric(number: 8, min_alpha: 4, min_numeric: 4) }
    status { rand(0..1) }
    disc_amount { rand(5..75) }
    disc_type { rand(0..1) }
    merchant_id { rand(1..20) }
    created_at { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :default) }
    updated_at { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :default) }
  end
end