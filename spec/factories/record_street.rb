FactoryBot.define do
  factory :record_street do
    postal          { '421-1131' }
    prefecture_id   { 2 }
    city            { '横浜市緑区' }
    address         { '青山１−１' }
    apartment       { 'ビル１０１' }
    phone_number    { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
