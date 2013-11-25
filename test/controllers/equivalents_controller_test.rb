require 'test_helper'

class EquivalentsControllerTest < ActionController::TestCase
  setup do
    @equivalent = equivalents(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:equivalents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create equivalent" do
    assert_difference('Equivalent.count') do
      post :create, equivalent: { name: @equivalent.name, namespace: @equivalent.namespace, organization: @equivalent.organization, url: @equivalent.url }
    end

    assert_redirected_to equivalent_path(assigns(:equivalent))
  end

  test "should show equivalent" do
    get :show, id: @equivalent
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @equivalent
    assert_response :success
  end

  test "should update equivalent" do
    patch :update, id: @equivalent, equivalent: { name: @equivalent.name, namespace: @equivalent.namespace, organization: @equivalent.organization, url: @equivalent.url }
    assert_redirected_to equivalent_path(assigns(:equivalent))
  end

  test "should destroy equivalent" do
    assert_difference('Equivalent.count', -1) do
      delete :destroy, id: @equivalent
    end

    assert_redirected_to equivalents_path
  end
end
