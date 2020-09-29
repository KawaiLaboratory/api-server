require 'test_helper'

class DataControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get data_create_url
    assert_response :success
  end

  test "should get index" do
    get data_index_url
    assert_response :success
  end

  test "should get show" do
    get data_show_url
    assert_response :success
  end

end
