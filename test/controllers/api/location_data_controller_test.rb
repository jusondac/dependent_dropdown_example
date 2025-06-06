require "test_helper"

class Api::LocationDataControllerTest < ActionDispatch::IntegrationTest
  test "should get provinces" do
    get api_location_data_provinces_url
    assert_response :success
  end

  test "should get cities" do
    get api_location_data_cities_url
    assert_response :success
  end
end
