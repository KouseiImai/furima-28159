FactoryBot.define do
  factory :user do
    nickname                  { Faker::Name.initials }
    email                     { Faker::Internet.free_email }
    # password                  {Faker::Internet.password(min_length:6)}
    password                  { 'a12345' }
    password_confirmation     { password }
    family_name               { Faker::Japanese::Name.last_name }
    first_name                { Faker::Japanese::Name.first_name }
    family_name_kana          { Faker::Japanese::Name.last_name.yomi }
    first_name_kana           { Faker::Japanese::Name.first_name.yomi }
    birthday                  { Faker::Date.between(from: '1930-01-01', to: '2015-12-31') }
  end
end
