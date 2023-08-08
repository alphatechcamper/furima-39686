FactoryBot.define do
  factory :user do
    email                 { Faker::Internet.email }
    password              { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    nickname              { Faker::Games::Pokemon.name }
    last_name             { '山田' }
    first_name            { '太郎' }
    last_name_kana        { 'ヤマダ' }
    first_name_kana       { 'タロウ' }
    user_birth_date { Faker::Date.birthday }
  end
end
