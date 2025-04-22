class Product < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }

  has_many_attached :images do |attachable|
      attachable.variant :thumb, resize_to_limit: [50, 50]
  end

  belongs_to :category
end
