FactoryBot.define do

  factory :item do
    id       {1}
    title    {"テストタイトル"}
    price    {1234567890}
    details  {"テスト詳細の書き込み"}
    user_id  {0}
    created_at { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
    user
  end

end