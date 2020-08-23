FactoryBot.define do
  
  factory :item do
    name          {"ノートPC"}
    description   {"未使用のノートPCです"}
    condition     {"未使用"}
    delivery_cost {"購入者負担"}
    sipping_area  {"神奈川県"}
    sipping_days  {"1〜2日"}
    price         {"100000"}
    category_id   {1}
    seller_id     {1}
    item_images {[
      FactoryBot.build(:item_image, item: nil)
    ]}
  end
end