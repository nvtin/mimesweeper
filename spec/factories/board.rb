board_height = Faker::Number.number(digits: 2)
board_width = Faker::Number.number(digits: 2)

FactoryBot.define do
  factory :board do
    name { Faker::Name.name }
  	height { board_height }
    width { board_width }
    num_mimes { Faker::Number.between(from: 0, to: board_height * board_width) }
    creator_email { Faker::Internet.email }
  end
end