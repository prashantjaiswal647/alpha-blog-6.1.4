require "test_helper"

class SignUpNewUserTest < ActionDispatch::IntegrationTest

  test "get sign-up form and create new user" do
    get "/signup"
    assert_response :success # Check that the signup page route is found
    assert_difference 'User.count', 1 do
      post users_path, params: {user: {username: "johndoe", email: "johndoe@example.com", password: "password"}}
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
    assert_match "Welcome", response.body
  end

end
