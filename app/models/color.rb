class Color < ApplicationRecord
	validates :color, presence: true

	belongs_to :material
	has_many :order_item

	has_attached_file :picture, styles: { medium: "320x180>", thumb: "100x100>" }
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/
end
