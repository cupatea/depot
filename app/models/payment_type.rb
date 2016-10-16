class PaymentType < ApplicationRecord
  def self.names
    pluck(:name)
  end
end
