require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test 'GET root path' do
    get root_path
    assert_response :success
  end
end
