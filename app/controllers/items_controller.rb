class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def search
    search = params[:search].strip
    @items = Item.where("name LIKE ?" ,"%#{search}%")
    render :index
  end

end
