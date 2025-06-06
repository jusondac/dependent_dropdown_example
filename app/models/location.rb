class Location < ApplicationRecord
  belongs_to :country
  belongs_to :province
  belongs_to :city

  validates :name, presence: true

  # Ensure data consistency
  validate :province_belongs_to_country
  validate :city_belongs_to_province

  private

  def province_belongs_to_country
    return unless province && country
    errors.add(:province, "must belong to the selected country") unless province.country_id == country.id
  end

  def city_belongs_to_province
    return unless city && province
    errors.add(:city, "must belong to the selected province") unless city.province_id == province.id
  end
end
