class ThingsController < ApplicationController
  def index
    @tags = Tag.where(name: params[:tags])
    @things = @tags.empty? ? Thing.all : Thing.tagged_with_all(@tags.map(&:name))
  end

  def edit
    @thing = Thing.find(params[:id])
  end

  def create
    @thing = Thing.create(thing_params)
    redirect_to :things
  end

  def update
    @thing = Thing.find(params[:id])
    @thing.update(thing_params)
    redirect_to :things
  end

  def destroy
    @thing = Thing.find(params[:id])
    @thing.destroy
    redirect_to :things
  end

private
  
  def thing_params
    params.require(:thing).permit(:name, :tag_list)
  end

end
