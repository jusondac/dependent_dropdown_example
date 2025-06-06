class Country < ApplicationRecord
  has_many :provinces, dependent: :destroy
  has_many :cities, through: :provinces
  has_many :locations, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
