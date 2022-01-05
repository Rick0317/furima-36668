FactoryBot.define do
  factory :item do
    name                  {'商品'}
    description           {'これは商品です。'}
    category_id           {2}
    region_id             {2}
    state_id              {2}
    ship_length_id        {2}
    shipping_cost_id      {2}
    price                 {400}
    user_id               {1}
    
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.jpg')
    end
  end
end
