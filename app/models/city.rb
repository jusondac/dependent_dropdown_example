class City < ApplicationRecord
  belongs_to :province
  has_many :locations, dependent: :destroy

  validates :name, presence: true
  validates :name, uniqueness: { scope: :province_id }

  delegate :country, to: :province
end
