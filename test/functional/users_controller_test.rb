require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: { address2: @user.address2, address: @user.address, city: @user.city, country: @user.country, crypted_password: @user.crypted_password, date_of_birth: @user.date_of_birth, date_of_registration: @user.date_of_registration, email: @user.email, email_verify: @user.email_verify, first_name: @user.first_name, landmark: @user.landmark, last_name: @user.last_name, middle_name: @user.middle_name, password_salt: @user.password_salt, persistence_token: @user.persistence_token, spam_user: @user.spam_user, state: @user.state, terms_acceptance: @user.terms_acceptance, user_type: @user.user_type, username: @user.username }
    end

    assert_redirected_to user_path(assigns(:user))
  end

  test "should show user" do
    get :show, id: @user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user
    assert_response :success
  end

  test "should update user" do
    put :update, id: @user, user: { address2: @user.address2, address: @user.address, city: @user.city, country: @user.country, crypted_password: @user.crypted_password, date_of_birth: @user.date_of_birth, date_of_registration: @user.date_of_registration, email: @user.email, email_verify: @user.email_verify, first_name: @user.first_name, landmark: @user.landmark, last_name: @user.last_name, middle_name: @user.middle_name, password_salt: @user.password_salt, persistence_token: @user.persistence_token, spam_user: @user.spam_user, state: @user.state, terms_acceptance: @user.terms_acceptance, user_type: @user.user_type, username: @user.username }
    assert_redirected_to user_path(assigns(:user))
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end
end
