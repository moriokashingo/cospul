class TagsController < ApplicationController

  def show
    tag = GutentagTag.find(params[:id])
    @pre_cospuls = []
    @cospul_ids = []
    gutentag_tagging = GutentagTagging.where(tag_id: tag.id)
    gutentag_tagging.each do |tag|
      @one_cospul = Cospul.find(tag.taggable_id)
      @pre_cospuls << @one_cospul
    end
    @pre_cospuls.each do |cospul|
      @one_cospul_id= cospul.id
      @cospul_ids << @one_cospul_id
    end
    @cospuls =Cospul.where(id: @cospul_ids).order("created_at DESC").page(params[:page]).per(9)
    @name = tag.name
  end

end
