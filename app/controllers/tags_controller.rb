class TagsController < ApplicationController
  def show
    tag = GutentagTag.find(params[:id])
    @cospuls = Cospul.tagged_with(ids: [tag.id]).new_posts.post_includes.set_page(params[:page])
    @name = tag.name
  end
end
