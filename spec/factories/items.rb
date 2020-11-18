FactoryBot.define do
  factory :item do
    title              { 'test' }
    text             { 'test' }
    category_id            { '3' }
    status_id        { '2' }
    delivery_fee_id       { '2' }
    area_id              { '2' }
    days_id              { '2' }
    price              { '300' }
    user_id              { '2' }
  end
end
