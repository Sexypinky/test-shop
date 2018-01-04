class TagsController < ApplicationController
  def show
    @tag = Tag.find_by(name: params[:id])
    @pages = @tag.pages
  end
end
