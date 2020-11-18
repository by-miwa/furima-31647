FactoryBot.define do
  factory :item do

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

    title            { 'coffee' }
    text             { 'test' }
    category_id      {3}
    status_id        {2}
    delivery_fee_id  {2}
    area_id          {2}
    days_id          {2}
    price            {300}

    association :user
  end
end
