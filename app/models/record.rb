class Record < ApplicationRecord
  belongs_to :user
  has_one :record
  has_one_attached :image
end
