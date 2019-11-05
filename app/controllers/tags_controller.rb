class TagsController < ApplicationController
  def create
    @tag  = Tag.create(tag_params)
    if @tag.save
      redirect_to new_cospul_path
    else
      render :new
    end
  end

  def index
    @tags = Tag.where('name LIKE(?)', "%#{params[:keyword]}%")
    @tag_last = Tag.last
    respond_to do |format|
      format.html
      format.json
    end
  end

  def show
    tag = Tag.find(params[:id])
    @name = tag.name
    @cospuls = tag.cospuls.page(params[:page]).per(5).order("created_at DESC")
  end

  private

  def tag_params
    # params.permit(:content).merge(user_id: current_user.id)
    params.require(:tag).permit(:name,:created_at,:updated_at)
  end
end
