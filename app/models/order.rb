class Order < ActiveRecord::Base
  #PTYPE = [ "Check", "Credit card", "Purchase order" ]
  has_many :line_items, dependent: :destroy
  validates :name, :address, :email, presence: true
  validates_inclusion_of :pay_type, in: PaymentType.names
  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end
end
