require 'test_helper'

class PricetypesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get pricetypes_show_url
    assert_response :success
  end

end
