class Api::V1::ItemsController < ApplicationController
  respond_to :json

  def index
    respond_with Item.all
  end
  #testing

  def create
    respond_with Item.create(item_params), location: nil
  end

  def update
    respond_with Item.update(params[:id], item_params), location: nil
  end

  def show
    respond_with Item.find_by(id: params[:id])
  end

  def destroy
    respond_with Item.destroy(params[:id])
  end

  def find
    if params.include?("name")
      respond_with Item.find_by(name: params[:name])
    elsif params.include?("description")
      respond_with Item.find_by(description: params[:description])
    elsif params.include?("unit_price")
      respond_with Item.find_by(unit_price: params[:unit_price])
    elsif params.include?("merchant_id")
      respond_with Item.find_by(merchant_id: params[:merchant_id])
    else
      respond_with Item.find_by(id: params[:id])
    end
  end

  private
  # May need to change/remove
  def item_params
    params.require(:item).permit(:name, :description)
  end
end
