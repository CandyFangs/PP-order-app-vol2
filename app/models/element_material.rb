class ElementMaterial < ApplicationRecord
	has_many :elements
	has_many :materials
end
