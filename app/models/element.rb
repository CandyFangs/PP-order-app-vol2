class Element < ApplicationRecord
	validates :name, presence: true
	validates :material_id, presence: true

	belongs_to :product
	belongs_to :material
	has_many :order_item
end
