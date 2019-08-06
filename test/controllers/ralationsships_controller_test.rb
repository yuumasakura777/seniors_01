require 'test_helper'

class RalationsshipsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get ralationsships_create_url
    assert_response :success
  end

  test "should get destroy" do
    get ralationsships_destroy_url
    assert_response :success
  end

end
