class RecordStreet
  include ActiveModel::Model
  attr_accessor :item_id, :postal, :prefecture_id, :city, :address, :apartment, :phone_number, :user_id, :token

  with_options presence: true do
    validates :postal
    validates :prefecture_id
    validates :city
    validates :address
    validates :phone_number
    validates :token, presence: true
  end

  validates :prefecture_id, numericality: { other_than: 1 } 
  validates :postal, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
  validates :phone_number, length: { maximum: 11, message: 'is invalid. Include hyphen(-)' }

  def save
    record = Record.create(item_id: item_id, user_id: user_id)
    Street.create(postal: postal, prefecture_id: prefecture_id, city: city, address: address, apartment: apartment, phone_number: phone_number, record_id: record.id)
  end
end
