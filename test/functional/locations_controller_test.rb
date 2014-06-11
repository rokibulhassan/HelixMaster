require 'test_helper'

class LocationsControllerTest < ActionController::TestCase
  setup do
    @location = locations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:locations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create location" do
    assert_difference('Location.count') do
      post :create, location: { address1: @location.address1, address2: @location.address2, area_id: @location.area_id, bank_account_holder: @location.bank_account_holder, bank_account_number: @location.bank_account_number, bank_name: @location.bank_name, bbm: @location.bbm, city_id: @location.city_id, country_id: @location.country_id, description: @location.description, drop_off_location: @location.drop_off_location, gps_code: @location.gps_code, hours_operation: @location.hours_operation, kit_available_for_purchase: @location.kit_available_for_purchase, location_type_id: @location.location_type_id, name: @location.name, note: @location.note, state_id: @location.state_id, telephone1: @location.telephone1, telephone2: @location.telephone2, website: @location.website, whatsapp: @location.whatsapp }
    end

    assert_redirected_to location_path(assigns(:location))
  end

  test "should show location" do
    get :show, id: @location
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @location
    assert_response :success
  end

  test "should update location" do
    put :update, id: @location, location: { address1: @location.address1, address2: @location.address2, area_id: @location.area_id, bank_account_holder: @location.bank_account_holder, bank_account_number: @location.bank_account_number, bank_name: @location.bank_name, bbm: @location.bbm, city_id: @location.city_id, country_id: @location.country_id, description: @location.description, drop_off_location: @location.drop_off_location, gps_code: @location.gps_code, hours_operation: @location.hours_operation, kit_available_for_purchase: @location.kit_available_for_purchase, location_type_id: @location.location_type_id, name: @location.name, note: @location.note, state_id: @location.state_id, telephone1: @location.telephone1, telephone2: @location.telephone2, website: @location.website, whatsapp: @location.whatsapp }
    assert_redirected_to location_path(assigns(:location))
  end

  test "should destroy location" do
    assert_difference('Location.count', -1) do
      delete :destroy, id: @location
    end

    assert_redirected_to locations_path
  end
end
