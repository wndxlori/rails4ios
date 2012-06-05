require 'test_helper'

class FieldTripsControllerTest < ActionController::TestCase
  setup do
    @field_trip = field_trips(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:field_trips)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create field_trip" do
    assert_difference('FieldTrip.count') do
      post :create, :field_trip => @field_trip.attributes
    end

    assert_redirected_to field_trip_path(assigns(:field_trip))
  end

  test "should show field_trip" do
    get :show, :id => @field_trip.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @field_trip.to_param
    assert_response :success
  end

  test "should update field_trip" do
    put :update, :id => @field_trip.to_param, :field_trip => @field_trip.attributes
    assert_redirected_to field_trip_path(assigns(:field_trip))
  end

  test "should destroy field_trip" do
    assert_difference('FieldTrip.count', -1) do
      delete :destroy, :id => @field_trip.to_param
    end

    assert_redirected_to field_trips_path
  end
end
