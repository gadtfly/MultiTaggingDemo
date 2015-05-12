class Api::TagsController < ApplicationController
  def index
    @tags = Tag.where("name LIKE ?", "#{params[:term]}%")
    render json: @tags
  end
end
