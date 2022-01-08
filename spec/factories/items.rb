FactoryBot.define do
  factory :item do
    item_name          {Faker::Lorem.sentence} 
    item_description   {Faker::Lorem.sentence} 
    category_id        {2}
    quality_id         {2}
    fee_id             {2}
    prefecture_id      {2}
    before_shipping_id {2}
    price              {400}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end