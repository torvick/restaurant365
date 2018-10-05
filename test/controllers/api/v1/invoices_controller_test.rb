require 'test_helper'

class Api::V1::InvoicesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get api_v1_invoices_create_url
    assert_response :success
  end

end
