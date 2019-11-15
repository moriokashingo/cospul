class TagsController < ApplicationController

  def show
    @cospuls = []
    tag = GutentagTag.find(params[:id])
    chukan = GutentagTagging.where(tag_id: tag.id)
    chukan.each do |tag|
      @one_cospul = Cospul.find(tag.taggable_id)
      @cospuls << @one_cospul
    end
    @name = tag.name
  end

end
