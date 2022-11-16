require 'test_helper'

class BackstoreControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get backstore_index_url
    assert_response :success
  end

end
