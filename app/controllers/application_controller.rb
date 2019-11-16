class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  include ApplicationHelper
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:image])
  end

  private
  def set_cospul
    @cospul = Cospul.find(params[:id])
  end

  def set_cospul_detail
    @cospul_detail = CospulDetail.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      flash[:notice] = "ログインしてください"
      redirect_to action: :index
    end
  end

  def user_id_check
    unless @cospul.user_id == current_user.id
      flash[:notice] = "ユーザーが違います"
      redirect_to action: :index
    end
  end

  def detail_user_id_check
    unless @cospul_detail.cospul.user_id == current_user.id
      flash[:notice] = "ユーザーが違います"
      redirect_to action: :index
    end
  end
end