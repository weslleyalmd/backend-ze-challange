FactoryBot.define do
  factory :supplier do
    tradingName { Faker::Lorem.word }
    ownerName { Faker::Movies::StarWars.character }
    document { Faker::Number.number(digits: 18) }
  end
end