class LikesController < ApplicationController
  before_action :set_variables,except: [:show]

  def like
    like = current_user.likes.new(cospul_id: @cospul.id)
    like.save
  end

  def unlike
    like = current_user.likes.find_by(cospul_id: @cospul.id)
    like.destroy
  end

  def show
    @cospuls = []
    user = User.find(current_user.id)
    #いいねモデルの現ユーザーがした物のレコードを取り出す。
    @likes = Like.where(user_id: "#{current_user.id}")
    #Cospulから上で取りだしたレコードのcospul_idのcospulレコードをeach文で持ってきて配列に入れる。
    @likes.each do |like|
      cospul = Cospul.find("#{like.cospul_id}")
      @cospuls << cospul
    end
    #ここにいいねした順に並べる記述を描きたい。
  end

  private

  def set_variables
    @cospul = Cospul.find(params[:cospul_id])
    @id_name = "#like-link-#{@cospul.id}"
  end

end