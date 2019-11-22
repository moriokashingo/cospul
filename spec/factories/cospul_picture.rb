FactoryBot.define do

  factory :cospul_picture, class: CospulPicture do
    picture      {File.open("#{Rails.root}/app/assets/images/kaonashi_bl.png")}
    association  :cospul, factory: :cospul
  end

end