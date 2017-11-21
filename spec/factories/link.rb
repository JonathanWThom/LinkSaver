FactoryGirl.define do
  factory :link do
    user
    url { Faker::Internet.url }
    title { Faker::Beer.name }
    html_preview "<h1>Hello World</h1>"
  end
end
