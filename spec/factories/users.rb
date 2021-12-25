FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 7)
    password {password}
    password_confirmation {password}
    last_name             {"鈴木"}
    first_name            {"太郎"}
    last_kana             {"スズキ"}
    first_kana            {"タロウ"}
    birth_date            {"1991/08/23"}
  end
end