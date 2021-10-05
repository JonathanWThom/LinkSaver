FactoryBot.define do
  factory :link do
    user
    address { Faker::Internet.url }
    page_title { Faker::Food.dish }
    html { "<h1>Hello World</h1>" }
  end
end
