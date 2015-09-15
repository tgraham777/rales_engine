class Api::V1::CustomersController < ApplicationController
  respond_to :json

  def show
    respond_with Customer.find_by(id: params[:id])
  end

  def index
    respond_with Customer.all
  end

  def create
    respond_with Customer.create(customer_params), location: nil
  end

  def update
    respond_with Customer.update(params[:id], customer_params), location: nil
  end

  def find
    if params.include?("first_name")
      respond_with Customer.find_by(first_name: params[:first_name])
    elsif params.include?("last_name")
      respond_with Customer.find_by(last_name: params[:last_name])
    else
      respond_with Customer.find_by(id: params[:id])
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:first_name, :last_name)
  end
end
