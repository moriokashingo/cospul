class CospulDetailsController < ApplicationController
  before_action :set_cospul_detail  , only: [:edit, :update]
  before_action :move_to_index
  before_action :detail_user_id_check  , only:   [:destroy, :edit, :update]

  def new
    @cospul_detail = CospulDetail.new
    @cospul_detail.accessories.build
    RakutenWebService.configure do |c|
      c.application_id = Rails.application.credentials.rakuten[:application_id]
      c.affiliate_id   = Rails.application.credentials.rakuten[:affiliate_id]
    end
    if params[:keyword]
      @items = RakutenWebService::Ichiba::Item.search(keyword: params[:keyword])
    end
  end

  def create
    @cospul_detail = CospulDetail.create(cospul_detail_params)
    if @cospul_detail.save
      redirect_to root_path
    else
      render :new
    end
  end


  def edit
    @cospul = Cospul.find(@cospul_detail.cospul_id)
    RakutenWebService.configure do |c|
      c.application_id = Rails.application.credentials.rakuten[:application_id]
      c.affiliate_id   = Rails.application.credentials.rakuten[:affiliate_id]
    end
    if params[:keyword]
      @items = RakutenWebService::Ichiba::Item.search(keyword: params[:keyword])
    end
  end

  def update
    if @cospul_detail.update(cospul_detail_params)
      redirect_to root_path
    else
      render :edit
    end
  end


  private
  def cospul_detail_params
    params.require(:cospul_detail).permit(:head,:top,:inner,:bottom,:shoe,accessories_attributes:[:name,:id,:_destroy]).merge(cospul_id: params[:cospul_id])
  end

end
