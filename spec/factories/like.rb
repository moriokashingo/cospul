FactoryBot.define do

  factory :like, class: Like do
    association      :cospul, factory: :cospul
    association      :user, factory: :user
  end

end