require "test_helper"

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get categories_create_url
    assert_response :success
  end
end
