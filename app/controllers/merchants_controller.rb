class MerchantsController < ApplicationController
  def index
    @merchants = EngineFacade.new
  end

  def show
   @items= EngineFacade.new.get_items(params[:id])
  end

  def search
    @merchant = EngineFacade.new.merchants_by_name(params[:name])
  end
end