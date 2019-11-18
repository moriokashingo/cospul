class RakutenController < ApplicationController
  def index
    RakutenWebService.configure do |c|
      c.application_id = Rails.application.credentials.rakuten[:application_id]
      c.affiliate_id = Rails.application.credentials.rakuten[:affiliate_id]
    end
    if params[:keyword]
    @items = RakutenWebService::Ichiba::Item.search(keyword: params[:keyword])
    end
    respond_to do |format|
      format.html
      format.json
    end
  end
end