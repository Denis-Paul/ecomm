FactoryBot.define do
    factory :category do
      name { "Electronics" }
      description { "Devices and gadgets" }
  
      # Image attachment for ActiveStorage. Make sure spec/fixtures/files/sample.jpg exists
      # after(:build) do |category|
      #   category.image.attach(
      #     io: File.open(Rails.root.join('spec/fixtures/files/sample.jpg')),
      #     filename: 'sample.jpg',
      #     content_type: 'image/jpeg'
      #   )
      # end
    end
end
  