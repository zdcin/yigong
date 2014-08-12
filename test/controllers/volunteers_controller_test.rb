require 'test_helper'

class VolunteersControllerTest < ActionController::TestCase
  setup do
    @volunteer = volunteers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:volunteers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create volunteer" do
    assert_difference('Volunteer.count') do
      post :create, volunteer: { address: @volunteer.address, baptized_day: @volunteer.baptized_day, belief_start_at: @volunteer.belief_start_at, birthday: @volunteer.birthday, cell_phone: @volunteer.cell_phone, id_card_num: @volunteer.id_card_num, is_baptized: @volunteer.is_baptized, join_at: @volunteer.join_at, mail: @volunteer.mail, name: @volunteer.name, quit_at: @volunteer.quit_at, skills: @volunteer.skills }
    end

    assert_redirected_to volunteer_path(assigns(:volunteer))
  end

  test "should show volunteer" do
    get :show, id: @volunteer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @volunteer
    assert_response :success
  end

  test "should update volunteer" do
    patch :update, id: @volunteer, volunteer: { address: @volunteer.address, baptized_day: @volunteer.baptized_day, belief_start_at: @volunteer.belief_start_at, birthday: @volunteer.birthday, cell_phone: @volunteer.cell_phone, id_card_num: @volunteer.id_card_num, is_baptized: @volunteer.is_baptized, join_at: @volunteer.join_at, mail: @volunteer.mail, name: @volunteer.name, quit_at: @volunteer.quit_at, skills: @volunteer.skills }
    assert_redirected_to volunteer_path(assigns(:volunteer))
  end

  test "should destroy volunteer" do
    assert_difference('Volunteer.count', -1) do
      delete :destroy, id: @volunteer
    end

    assert_redirected_to volunteers_path
  end
end
