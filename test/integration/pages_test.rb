require 'test_helper'

class PagesTest < ActionDispatch::IntegrationTest
  test "should get home" do
     get pages_home_url
   end
   test "should get root" do
     get root_url
     assert_response :success
   end
end
