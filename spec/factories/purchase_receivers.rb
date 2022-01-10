FactoryBot.define do
  factory :purchase_receiver do
    token          {"tok_abcdefghijk00000000000000000"}
    zip            {"123-4567"} 
    prefecture_id  {2}
    city           {"新宿区西新宿"}
    block          {"１丁目"}
    build          {"テストビル"}
    phone          {"09012345678"}   
  end
end