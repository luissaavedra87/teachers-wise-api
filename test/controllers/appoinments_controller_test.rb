require 'test_helper'

class AppoinmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @appoinment = appoinments(:one)
  end

  test "should get index" do
    get appoinments_url, as: :json
    assert_response :success
  end

  test "should create appoinment" do
    assert_difference('Appoinment.count') do
      post appoinments_url, params: { appoinment: { schedule: @appoinment.schedule, status: @appoinment.status, teacher_id: @appoinment.teacher_id, user_id: @appoinment.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show appoinment" do
    get appoinment_url(@appoinment), as: :json
    assert_response :success
  end

  test "should update appoinment" do
    patch appoinment_url(@appoinment), params: { appoinment: { schedule: @appoinment.schedule, status: @appoinment.status, teacher_id: @appoinment.teacher_id, user_id: @appoinment.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy appoinment" do
    assert_difference('Appoinment.count', -1) do
      delete appoinment_url(@appoinment), as: :json
    end

    assert_response 204
  end
end
