FactoryBot.define do
  factory :item do
    
    item_name               {Faker::Lorem.sentence}
    item_description        {Faker::Lorem.sentence}
    category_id             {'2'}
    item_status_id          {'2'}
    shipping_fee_id         {'2'}
    prefecture_id           {'2'}
    shipping_time_number_id {'2'}
    price                   {Faker::Number.between(from: 300, to: 9999999)}
    association             :user

     after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/item-sample.png'), filename: 'item-sample.png')
    end

  end
end
