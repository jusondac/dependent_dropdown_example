class Province < ApplicationRecord
  belongs_to :country
  has_many :cities, dependent: :destroy
  has_many :locations, dependent: :destroy

  validates :name, presence: true
  validates :name, uniqueness: { scope: :country_id }
end
