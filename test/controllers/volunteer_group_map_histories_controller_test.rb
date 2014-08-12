require 'test_helper'

class VolunteerGroupMapHistoriesControllerTest < ActionController::TestCase
  setup do
    @volunteer_group_map_history = volunteer_group_map_histories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:volunteer_group_map_histories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create volunteer_group_map_history" do
    assert_difference('VolunteerGroupMapHistory.count') do
      post :create, volunteer_group_map_history: { group_id: @volunteer_group_map_history.group_id, is_leader: @volunteer_group_map_history.is_leader, join_at: @volunteer_group_map_history.join_at, quit_at: @volunteer_group_map_history.quit_at, volunteer_id: @volunteer_group_map_history.volunteer_id }
    end

    assert_redirected_to volunteer_group_map_history_path(assigns(:volunteer_group_map_history))
  end

  test "should show volunteer_group_map_history" do
    get :show, id: @volunteer_group_map_history
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @volunteer_group_map_history
    assert_response :success
  end

  test "should update volunteer_group_map_history" do
    patch :update, id: @volunteer_group_map_history, volunteer_group_map_history: { group_id: @volunteer_group_map_history.group_id, is_leader: @volunteer_group_map_history.is_leader, join_at: @volunteer_group_map_history.join_at, quit_at: @volunteer_group_map_history.quit_at, volunteer_id: @volunteer_group_map_history.volunteer_id }
    assert_redirected_to volunteer_group_map_history_path(assigns(:volunteer_group_map_history))
  end

  test "should destroy volunteer_group_map_history" do
    assert_difference('VolunteerGroupMapHistory.count', -1) do
      delete :destroy, id: @volunteer_group_map_history
    end

    assert_redirected_to volunteer_group_map_histories_path
  end
end
