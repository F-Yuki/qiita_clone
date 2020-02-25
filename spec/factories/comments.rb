FactoryBot.define do
  factory :comment do
    body { "MyText" }
    user { nil }
    artile { nil }
  end
end
