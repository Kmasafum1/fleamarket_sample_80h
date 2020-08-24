FactoryBot.define do

  factory :user do
    
    nickname              {"nick"}
    email                 {"yamada@gmail.com"}
    password              {"1234567"}
    password_confirmation {"1234567"}
    first_name            {"山田"}
    last_name             {"太郎"}
    first_name_kana       {"ヤマダ"}
    last_name_kana        {"タロウ"}
    birthday              {"6"}
  end
end