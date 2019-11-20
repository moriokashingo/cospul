FactoryBot.define do

  factory :cospul, class: Cospul do
    title            { "テストタイトル" }
    content          { "テスト詳細" }
    association      :user, factory: :user
    after(:build) do |cospul|
      cospul.cospul_pictures<< build(:cospul_picture, cospul: cospul)
    end
    after(:create) do |cospul|
      # create(:gutentag_taggings, cospul: cospul, gutentag_tag: create(gutentag_tag))
      create_list(:gutentag_tag, 3, cospuls: [cospul])
    end
  end
  factory :cospul_no_picture, class: Cospul do
    title            { "テストタイトル" }
    content          { "テスト詳細" }
    association      :user, factory: :user
  end
end