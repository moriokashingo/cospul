FactoryBot.define do

  factory :cospul, class: Cospul do
    title            { "テストタイトル" }
    content          { "テスト詳細" }
    association      :user, factory: :user
  end

end