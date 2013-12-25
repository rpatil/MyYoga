require 'test_helper'

class ActivationsControllerTest < ActionController::TestCase
  test "should get activate_account" do
    get :activate_account
    assert_response :success
  end

  test "should get reset_password_link" do
    get :reset_password_link
    assert_response :success
  end

  test "should get newsletter_subscription" do
    get :newsletter_subscription
    assert_response :success
  end

end
