require 'test_helper'

class ConsultsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @consult = consults(:one)
  end

  test "should get index" do
    get consults_url, as: :json
    assert_response :success
  end

  test "should create consult" do
    assert_difference('Consult.count') do
      post consults_url, params: { consult: { date_requested: @consult.date_requested, uf_value: @consult.uf_value, username: @consult.username } }, as: :json
    end

    assert_response 201
  end

  test "should show consult" do
    get consult_url(@consult), as: :json
    assert_response :success
  end

  test "should update consult" do
    patch consult_url(@consult), params: { consult: { date_requested: @consult.date_requested, uf_value: @consult.uf_value, username: @consult.username } }, as: :json
    assert_response 200
  end

  test "should destroy consult" do
    assert_difference('Consult.count', -1) do
      delete consult_url(@consult), as: :json
    end

    assert_response 204
  end
end
