require 'test_helper'

class SchedulesControllerTest < ActionController::TestCase
  setup do
    @scedule = scedules(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:schedules)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create scedule" do
    assert_difference('Scedule.count') do
      post :create, scedule: @scedule.attributes
    end

    assert_redirected_to scedule_path(assigns(:scedule))
  end

  test "should show scedule" do
    get :show, id: @scedule
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @scedule
    assert_response :success
  end

  test "should update scedule" do
    put :update, id: @scedule, scedule: @scedule.attributes
    assert_redirected_to scedule_path(assigns(:scedule))
  end

  test "should destroy scedule" do
    assert_difference('Scedule.count', -1) do
      delete :destroy, id: @scedule
    end

    assert_redirected_to scedules_path
  end
end
