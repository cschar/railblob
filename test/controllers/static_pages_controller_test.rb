require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get contact" do
    get contact_path

    assert_response :success

  end

  test "should get help" do
    get help_path
    # get static_pages_help_url
    assert_response :success
  end
  #
  # test "should get help path" do
  #   get help_path
  #   assert_response :success
  #   assert_select "title", "Help"
  # end


end
