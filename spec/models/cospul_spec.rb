require 'rails_helper'

RSpec.describe Cospul, type: :model do

  before do
    @user           = FactoryBot.build(:user)
    @cospul         = FactoryBot.build(:cospul)
    @cospul_picture = FactoryBot.build(:cospul_picture)
  end

  it "has a valid factory of user" do
    user = @user
    expect(user).to be_valid
  end
# # バリデーション
#   it "is valid with a :name,:price,:region,:delivery_fee,:shipping_method,:delivery_days,:brand,:category,:user" do
#     cospul = @cospul
#     expect(cospul).to be_valid
#   end
it "is valid with a :name,:price,:region,:delivery_fee,:shipping_method,:delivery_days,:brand,:category,:user" do
  cospul = @cospul
  expect(cospul).to be_valid
end



  it "is invalid without a title" do
    cospul = build(:cospul, title: nil)
    cospul.valid?
    expect(cospul.errors[:title]).to include("を入力してください")
  end
  it "is invalid without a content" do
    cospul = build(:cospul, content: nil)
    cospul.valid?
    expect(cospul.errors[:content]).to include("を入力してください")
  end

# 文字数制限
it "is invalid with title more than 40 words" do
  cospul = build(:cospul, title: "a"* 41,)
  cospul.valid?
  expect(cospul.errors[:title]).to include("は40文字以内で入力してください")  
end
it "is invalid with content more than 1000 words" do
  cospul = build(:cospul, content: "a" * 1001,)
  cospul.valid?
  expect(cospul.errors[:content]).to include("は1000文字以内で入力してください")
end

end
