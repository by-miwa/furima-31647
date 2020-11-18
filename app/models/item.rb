class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_fee
  belongs_to :area
  belongs_to :day
  
  validates :image, presence: true
  validates :title, presence: true
  validates :category_id, :status_id, :delivery_fee_id, :area_id, :days_id, numericality: { other_than: 1 } 

  belongs_to :user
  has_one :record
  has_one_attached :image
end