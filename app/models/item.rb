class Item < ApplicationRecord
  has_many :item_images
  belongs_to :category
  belongs_to :brand
  belongs_to :user
end
