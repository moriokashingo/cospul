class CospulsController < ApplicationController

  def index
    @cospuls =Cospul.order("created_at DESC").page(params[:page]).per(9)
    @like = Like.new
    @user = current_user

  end

  def new
    @cospul = Cospul.new
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
  end

  def update
    @cospul = Cospul.find(params[:id])
    if @cospul.user_id == current_user.id
      if @cospul.update(cospul_params)
        if @cospul.cospul_detail.present?
          redirect_to edit_cospul_cospul_detail_path(@cospul.id,@cospul.cospul_detail)
        else
          redirect_to new_cospul_cospul_detail_path(@cospul.id)
        end
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

  def search
    @keyword= params[:search]
    @keyword_tags = GutentagTag.find_by(name: params[:search])
    if @keyword_tags.present?
      @tag_cospuls =   GutentagTagging.where(tag_id: @keyword_tags.id)
      @tag_cospuls.each do |tag|
        @keyword_cospuls = []
        @one_cospuls = Cospul.find(tag.taggable_id)
        @keyword_cospuls << @one_cospuls
      end
    end

    @tags = GutentagTag.where('name LIKE(?)', "%#{params[:keyword]}%")
    respond_to do |format|
      format.html
      format.json
    end
  end
  private

  def cospul_params
    params.require(:cospul).permit(:content,:title,:tags_as_string,cospul_pictures_attributes:[:picture,:_destroy,:id]).merge(user_id: current_user.id)
  end
end
