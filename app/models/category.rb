class Category < ApplicationRecord
	has_many :products
	has_many :orders
	# acts_as_tree order: "name"
end
