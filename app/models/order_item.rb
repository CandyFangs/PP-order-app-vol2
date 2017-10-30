class OrderItem < ApplicationRecord
	belongs_to :product
	belongs_to :color
	belongs_to :element
	belongs_to :order
end
