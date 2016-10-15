require 'test_helper'

class LineItemsControllerTest < ActionController::TestCase
  setup do
    @line_item_one = line_items(:one)
    @line_item_two = line_items(:two)
  end

  test "should get index" do
    get :index, params:{}
    assert_response :success
  end

  test "should get new" do
    get :new, params:{}
    assert_response :success
  end

  test "should create line_item" do
    assert_difference('LineItem.count') do
      post :create, params: { product_id: products(:ruby).id }
    end
    assert_redirected_to store_path
  end

  test "should show line_item" do
    get :show,params:{id: @line_item_one}
    assert_response :success
  end

  test "should get edit" do
    get :edit, params:{id: @line_item_one}
    assert_response :success
  end

  test "should update line_item" do
    patch :update,params: {id: @line_item_one, line_item: {
      cart_id: @line_item_one.cart_id, product_id: @line_item_two.product_id }}
    assert_response :success
  end

  test "should create line_item via ajax" do
    assert_difference('LineItem.count') do
      post :create, xhr:true, params: {product_id: products(:ruby).id}
    end
    assert_response :success
    assert_select_jquery :html, '#cart' do
      assert_select 'tr#current_item td', /Programming Ruby 1.9/
    end
  end
end
