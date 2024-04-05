require "test_helper"

class DoQuizControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get do_quiz_create_url
    assert_response :success
  end
end
