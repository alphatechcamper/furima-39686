FactoryBot.define do
  factory :order_form do
    postal_code { '590-0000' }
    prefecture_id { 5 }
    city { '千早青坂村' }
    addresses { '1-0-1' }
    building_name { 'クラブハウス101' }
    phone_number { '07077777777' }

    token { 'tok_abcdefghijk00000000000000000' }
  end
end
