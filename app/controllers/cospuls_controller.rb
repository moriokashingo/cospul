class CospulsController < ApplicationController
  before_action :set_cospul     , only:   [:show, :destroy, :edit, :update]
  before_action :move_to_index  , except: [:index,:show]
  before_action :user_id_check  , only:   [:destroy, :edit, :update]

  def index
    @cospuls =Cospul.new_posts.post_includes.set_page(params[:page])
  end

  def new
    @cospul = Cospul.new
    @cospul.cospul_pictures.build
  end


  def create
    @cospul = Cospul.create(cospul_params)
      if @cospul.save
      redirect_to new_cospul_cospul_detail_path(@cospul.id)
    else
      render :new
    end
  end


  def edit
  end

  def update
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

  def show
    if @cospul.cospul_detail.present?
      @cospul_detail = CospulDetail.find_by(cospul_id: params[:id])
      @accessories = Accessory.where(cospul_detail_id: " #{@cospul_detail.id}")
    end
  end


  def destroy
    @cospul.destroy if @cospul.user_id == current_user.id
  end

  def search
    @keyword = params[:search]
    search_tag = GutentagTag.find_by(name: params[:search])
    if search_tag.present?
      tag_ids = GutentagTagging.where(tag_id: search_tag.id).select(:taggable_id)
      @cospuls = Cospul.where(id: tag_ids).post_includes.set_page(params[:page])
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
