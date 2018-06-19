require 'test_helper'

class AdoptControllerTest < ActionDispatch::IntegrationTest
  test "should get request" do
    get adopt_request_url
    assert_response :success
  end

end
