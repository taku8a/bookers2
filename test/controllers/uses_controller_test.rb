require 'test_helper'

class UsesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get uses_show_url
    assert_response :success
  end

end
