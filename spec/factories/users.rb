
FactoryBot.define do

  factory :user, class: User do
    name                  { "nakata" }
    image                 {File.open("#{Rails.root}/app/assets/images/kaonashi_bk.png")}
    email                 { "nakata@example.com" }
    password              { "00000000" }
    password_confirmation { "00000000" }
  end

end