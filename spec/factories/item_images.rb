FactoryBot.define do
  
  factory :item_image do 
    image {File.open("#{Rails.root}/public/uploads/item_image/image/1/ダウンロード.jpeg")}
    item_id {1}
  end
end