class Item < ApplicationRecord
  has_many :item_images
  # optional: tureは最終的に外す。今はこれがないとテーブルに保存できないので
  belongs_to :category, optional: true
  # optional: tureは最終的に外す。今はこれがないとテーブルに保存できないので
  belongs_to :brand, optional: true
  belongs_to :seller, class_name: "User"
  belongs_to :buyer, class_name: "User"
end
