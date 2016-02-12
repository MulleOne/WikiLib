require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get authors" do
    get :authors
    assert_response :success
  end

  test "should get books" do
    get :books
    assert_response :success
  end

  test "should get summaries" do
    get :summaries
    assert_response :success
  end

  test "should get contact" do
    get :contact
    assert_response :success
  end

end
