require 'test_helper'

class CartsControllerTest < ActionController::TestCase
  setup do
    @cart = carts(:one)
  end

  test "should get index" do
    get :index, params:{}
    assert_response :success
    assert_not_nil assigns(:carts)
  end

  test "should get new" do
    get :new, params:{}
    assert_response :success
  end

  test "should create cart" do
    assert_difference('Cart.count') do
      post :create, params:{cart: {  }}
    end
    assert_redirected_to cart_path(assigns(:cart))
  end
  test "should show cart" do
    get :show, params:{id: @cart}
    assert_response :success
  end
  test "should get edit" do
    get :edit,params:{id: @cart}
    assert_response :success
  end

  test "should update cart" do
    patch :update,params:{ id: @cart, cart: {  }}
    assert_redirected_to cart_path(assigns(:cart))
  end

  test "should destroy cart" do
    assert_difference('Cart.count', -1) do
      session[:cart_id] = @cart.id
      delete :destroy, params:{id: @cart}
    end

    assert_redirected_to store_path
  end
end
