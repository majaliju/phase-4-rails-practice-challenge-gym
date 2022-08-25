require "test_helper"

class GymsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @gym = gyms(:one)
  end

  test "should get index" do
    get gyms_url, as: :json
    assert_response :success
  end

  test "should create gym" do
    assert_difference('Gym.count') do
      post gyms_url, params: { gym: { address: @gym.address, name: @gym.name } }, as: :json
    end

    assert_response 201
  end

  test "should show gym" do
    get gym_url(@gym), as: :json
    assert_response :success
  end

  test "should update gym" do
    patch gym_url(@gym), params: { gym: { address: @gym.address, name: @gym.name } }, as: :json
    assert_response 200
  end

  test "should destroy gym" do
    assert_difference('Gym.count', -1) do
      delete gym_url(@gym), as: :json
    end

    assert_response 204
  end
end
