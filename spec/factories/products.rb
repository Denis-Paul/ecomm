FactoryBot.define do
    factory :product do
        name { "Sample Product" }
        description { "This is a great product." }
        price { 1999 }
        active { true }
        association :category
    end
end
  