class Api::LocationDataController < ApplicationController
  def provinces
    country = Country.find(params[:country_id])
    provinces = country.provinces.order(:name)

    render json: provinces.map { |province| { id: province.id, name: province.name } }
  rescue ActiveRecord::RecordNotFound
    render json: []
  end

  def cities
    province = Province.find(params[:province_id])
    cities = province.cities.order(:name)

    render json: cities.map { |city| { id: city.id, name: city.name } }
  rescue ActiveRecord::RecordNotFound
    render json: []
  end
end
