class Material < ApplicationRecord
	validates :brand, presence: true

	has_many :colors, dependent: :destroy
	has_many :elements
	has_many :products, through: :elements
	
end
