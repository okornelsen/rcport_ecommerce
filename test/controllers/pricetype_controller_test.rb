require 'test_helper'

class PricetypeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pricetype_index_url
    assert_response :success
  end

  test "should get show" do
    get pricetype_show_url
    assert_response :success
  end

end
