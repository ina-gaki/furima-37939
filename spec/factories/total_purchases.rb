FactoryBot.define do
  factory :total_purchase do
      postal_code                {'222-2222'}
      prefecture_id              {2}
      city                       {'テスト市'}
      shipping_address           {'テスト町1-1'}
      building                   {'テストビル'}
      phone_number               {'22222222222'}
      token {"tok_abcdefghijk00000000000000000"}
  end
end
