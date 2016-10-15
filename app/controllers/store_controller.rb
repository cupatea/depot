class StoreController < ApplicationController
  include StoreHelper
  include CurrentCart
  before_action :set_cart
  def index
    @products = Product.order(:title)
    @count = increment_count
  end
end
