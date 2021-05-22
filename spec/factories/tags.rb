FactoryBot.define do
  factory :tag do
    user
    title { Faker::Creature::Dog.name }
    color { Faker::Color.hex_color }
  end
end
