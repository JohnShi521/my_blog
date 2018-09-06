require 'test_helper'

class AdminMagic::CategoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_magic_categories_index_url
    assert_response :success
  end

end
