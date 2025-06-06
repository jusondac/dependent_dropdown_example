class LocationsController < ApplicationController
  before_action :set_location, only: [ :show, :edit, :update, :destroy ]
  before_action :load_countries, only: [ :new, :edit, :create, :update ]

  def index
    @locations = Location.includes(:country, :province, :city).order(:name)
  end

  def show
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)

    if @location.save
      redirect_to @location, notice: "Location was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @location.update(location_params)
      redirect_to @location, notice: "Location was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @location.destroy
    redirect_to locations_url, notice: "Location was successfully deleted."
  end

  private

  def set_location
    @location = Location.find(params[:id])
  end

  def load_countries
    @countries = Country.order(:name)
  end

  def location_params
    params.require(:location).permit(:name, :country_id, :province_id, :city_id)
  end
end
