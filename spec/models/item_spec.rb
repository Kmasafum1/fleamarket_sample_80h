# require 'rails_helper'

# describe Item do
#   describe '#create' do
#     context 'If you can save the item' do

#       it "cannot register without a name" do
#         item = build(:item, name: nil)
#         item.valid?
#         expect(item.errors[:name]).to include("を入力してください")
#       end

#       it "cannot register without a description" do
#         item = build(:item, description: nil)
#         item.valid?
#         expect(item.errors[:description]).to include("を入力してください")
#       end

#       it "cannot register without a condition" do
#         item = build(:item, condition: nil)
#         item.valid?
#         expect(item.errors[:condition]).to include("を入力してください")
#       end

#       it "cannot register without a delivery_cost" do
#         item = build(:item, delivery_cost: nil)
#         item.valid?
#         expect(item.errors[:delivery_cost]).to include("を入力してください")
#       end

#       it "cannot register without a sipping_area" do
#         item = build(:item, sipping_area: nil)
#         item.valid?
#         expect(item.errors[:sipping_area]).to include("を入力してください")
#       end

#       it "cannot register without a sipping_days" do
#         item = build(:item, sipping_days: nil)
#         item.valid?
#         expect(item.errors[:sipping_days]).to include("を入力してください")
#       end

#       it "cannot register without a price" do
#         item = build(:item, price: nil)
#         item.valid?
#         expect(item.errors[:price]).to include("を入力してください")
#       end

#       it "cannot register without a category_id" do
#         item = build(:item, category_id: nil)
#         item.valid?
#         expect(item.errors[:category_id]).to include("を入力してください")
#       end

#       it "cannot register without a seller_id" do
#         item = build(:item, seller_id: nil)
#         item.valid?
#         expect(item.errors[:seller_id]).to include("を入力してください")
#       end

#       # it "you can save if you have all" do
#       #   item = build(:item)
#       #   expect(item).to be_valid
#       # end
#     end
#   end
# end