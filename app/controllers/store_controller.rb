class StoreController < ApplicationController
  include StoreHelper
  def index
    @products = Product.order(:title)
    @count = increment_count
  end
end
