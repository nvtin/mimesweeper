FactoryBot.define do
  factory :cell do
    board
  	row { Faker::Number.number(digits: 2) }
    column { Faker::Number.number(digits: 2) }
    is_mime { Faker::Boolean.boolean }
  end
end