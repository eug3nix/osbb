require 'test_helper'

class EstatesControllerTest < ActionController::TestCase
  setup do
    @estate = estates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:estates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create estate" do
    assert_difference('Estate.count') do
      post :create, estate: { estate_type_id: @estate.estate_type_id, floor: @estate.floor, living_area: @estate.living_area, name: @estate.name, regnum: @estate.regnum, rooms: @estate.rooms, total_area: @estate.total_area }
    end

    assert_redirected_to estate_path(assigns(:estate))
  end

  test "should show estate" do
    get :show, id: @estate
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @estate
    assert_response :success
  end

  test "should update estate" do
    patch :update, id: @estate, estate: { estate_type_id: @estate.estate_type_id, floor: @estate.floor, living_area: @estate.living_area, name: @estate.name, regnum: @estate.regnum, rooms: @estate.rooms, total_area: @estate.total_area }
    assert_redirected_to estate_path(assigns(:estate))
  end

  test "should destroy estate" do
    assert_difference('Estate.count', -1) do
      delete :destroy, id: @estate
    end

    assert_redirected_to estates_path
  end
end
