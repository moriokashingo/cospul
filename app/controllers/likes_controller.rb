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
    @likes = Like.where(user_id: "#{current_user.id}").pluck(:cospul_id)
    @cospuls = Cospul.where(id: @likes).includes(:user,:likes,:cospul_pictures,:taggings,:tags).page(params[:page]).per(9)
  end

  private

  def set_variables
    @cospul = Cospul.find(params[:cospul_id])
    @id_name = "#like-link-#{@cospul.id}"
  end

end