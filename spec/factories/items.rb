FactoryBot.define do
  factory :item do
    association :user

    name               {'test'}
    description        {'テストの説明文'}
    category_id        {2}
    item_status_id     {2}
    cost_id            {2}
    prefecture_id      {2}
    send_days_id       {2}
    price              {'1000'}

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
