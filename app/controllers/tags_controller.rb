class TagsController < ApplicationController

  def show
    # binding.pry
    tag = GutentagTag.find(params[:id])
    tag_ids = GutentagTagging.where(tag_id: tag.id).select(:taggable_id)
    @cospuls = Cospul.where(id: tag_ids).includes(:user,:likes,:cospul_pictures,:taggings,:tags).page(params[:page]).per(9)
    @name = tag.name
  end

end
