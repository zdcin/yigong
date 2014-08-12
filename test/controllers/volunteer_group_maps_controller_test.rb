require 'test_helper'

class VolunteerGroupMapsControllerTest < ActionController::TestCase
  setup do
    @volunteer_group_map = volunteer_group_maps(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:volunteer_group_maps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create volunteer_group_map" do
    assert_difference('VolunteerGroupMap.count') do
      post :create, volunteer_group_map: { group_id: @volunteer_group_map.group_id, is_leader: @volunteer_group_map.is_leader, join_at: @volunteer_group_map.join_at, volunteer_id: @volunteer_group_map.volunteer_id }
    end

    assert_redirected_to volunteer_group_map_path(assigns(:volunteer_group_map))
  end

  test "should show volunteer_group_map" do
    get :show, id: @volunteer_group_map
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @volunteer_group_map
    assert_response :success
  end

  test "should update volunteer_group_map" do
    patch :update, id: @volunteer_group_map, volunteer_group_map: { group_id: @volunteer_group_map.group_id, is_leader: @volunteer_group_map.is_leader, join_at: @volunteer_group_map.join_at, volunteer_id: @volunteer_group_map.volunteer_id }
    assert_redirected_to volunteer_group_map_path(assigns(:volunteer_group_map))
  end

  test "should destroy volunteer_group_map" do
    assert_difference('VolunteerGroupMap.count', -1) do
      delete :destroy, id: @volunteer_group_map
    end

    assert_redirected_to volunteer_group_maps_path
  end
end
