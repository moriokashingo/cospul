class CospulsController < ApplicationController

  def index
    @cospuls =Cospul.order("created_at DESC").page(params[:page]).per(9)
    @like = Like.new
    @user = current_user
  end

  def new
    @cospul = Cospul.new
    @cospul.tags
    @tag  = Tag.new
    @cospul.cospul_pictures.build
  end


  def create
    @cospul = Cospul.create(cospul_params)
    @cospul.save
      if @cospul.save
      redirect_to new_cospul_cospul_detail_path(@cospul.id)
    else
      render :new
    end
  end


  def edit
    @cospul = Cospul.find(params[:id])
    @tag  = Tag.new
  end

  def update
    @cospul = Cospul.find(params[:id])
    if @cospul.user_id == current_user.id
      if @cospul.update(cospul_params)
        redirect_to edit_cospul_cospul_detail_path(@cospul,@cospul.cospul_detail)
      else
        render :edit
      end
    end
  end

  def show
    @cospul = Cospul.find(params[:id])
    if @cospul.cospul_detail.present?
      @cospul_detail = CospulDetail.find_by(cospul_id: params[:id])
      @accessories = Accessory.where(cospul_detail_id: " #{@cospul_detail.id}")
    end
    @like = Like.new
  end


  def destroy
    cospul = Cospul.find(params[:id])
    cospul.destroy if cospul.user_id == current_user.id
  end

  private

  def cospul_params
    params.require(:cospul).permit(:content,:title,{tag_ids: []},cospul_pictures_attributes:[:picture,:_destroy,:id]).merge(user_id: current_user.id)
  end
end
