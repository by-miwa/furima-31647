class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_fee
  belongs_to :area
  belongs_to :day

  with_options presence: true do
    validates :image
    validates :title
    validates :text
    validates :price
    validates :category_id
  end

  validates :category_id, :status_id, :delivery_fee_id, :area_id, :day_id, numericality: { other_than: 1 }

  validates :price, presence: true, format: { with: /\A[0-9]+\z/ }
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  belongs_to :user
  has_one :record
  has_one_attached :image
end
