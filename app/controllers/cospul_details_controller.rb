class CospulDetailsController < ApplicationController
  def new
    @cospul_detail = CospulDetail.new
    @cospul_id = @cospul_detail.id
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
    @cospul_detail = CospulDetail.create(new_cospul_detail_params)
    if @cospul_detail.save
      redirect_to root_path
    else
      render :new
    end
  end


  def edit
    @cospul_detail = CospulDetail.find(params[:id])
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
    cospul_detail = CospulDetail.find(params[:id])
    if cospul_detail.update(edit_cospul_detail_params)
      redirect_to root_path
    else
      render :edit
    end
  end


  private
  def new_cospul_detail_params
    params.require(:cospul_detail).permit(:head,:top,:inner,:bottom,:shoe,accessories_attributes:[:name]).merge(cospul_id: params[:cospul_id])
  end

  def edit_cospul_detail_params
    params.require(:cospul_detail).permit(:head,:top,:inner,:bottom,:shoe,:cospul_id,accessories_attributes:[:name])
  end
end
