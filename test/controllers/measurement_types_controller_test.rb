require 'test_helper'

class MeasurementTypesControllerTest < ActionController::TestCase
  setup do
    @measurement_type = measurement_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:measurement_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create measurement_type" do
    assert_difference('MeasurementType.count') do
      post :create, measurement_type: { name: @measurement_type.name }
    end

    assert_redirected_to measurement_type_path(assigns(:measurement_type))
  end

  test "should show measurement_type" do
    get :show, id: @measurement_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @measurement_type
    assert_response :success
  end

  test "should update measurement_type" do
    patch :update, id: @measurement_type, measurement_type: { name: @measurement_type.name }
    assert_redirected_to measurement_type_path(assigns(:measurement_type))
  end

  test "should destroy measurement_type" do
    assert_difference('MeasurementType.count', -1) do
      delete :destroy, id: @measurement_type
    end

    assert_redirected_to measurement_types_path
  end
end
