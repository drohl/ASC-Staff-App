require 'test_helper'

class StaysControllerTest < ActionDispatch::IntegrationTest
  setup do
    @stay = stays(:one)
  end

  test "should get index" do
    get stays_url
    assert_response :success
  end

  test "should get new" do
    get new_stay_url
    assert_response :success
  end

  test "should create stay" do
    assert_difference('Stay.count') do
      post stays_url, params: { stay: { note: @stay.note } }
    end

    assert_redirected_to stay_url(Stay.last)
  end

  test "should show stay" do
    get stay_url(@stay)
    assert_response :success
  end

  test "should get edit" do
    get edit_stay_url(@stay)
    assert_response :success
  end

  test "should update stay" do
    patch stay_url(@stay), params: { stay: { note: @stay.note } }
    assert_redirected_to stay_url(@stay)
  end

  test "should destroy stay" do
    assert_difference('Stay.count', -1) do
      delete stay_url(@stay)
    end

    assert_redirected_to stays_url
  end
end
