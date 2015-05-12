class ThingsController < ApplicationController
  def index
    @things = params[:tag] ? Thing.tagged_with(params[:tag]) : Thing.all
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
