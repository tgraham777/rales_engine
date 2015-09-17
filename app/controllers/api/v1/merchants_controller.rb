class Api::V1::MerchantsController < ApplicationController
  respond_to :json

  def index
    respond_with Merchant.all
  end

  def show
    respond_with merchant
  end

  def find
    respond_with Merchant.find_by(merchant_params)
  end

  def find_all
    respond_with Merchant.where(merchant_params)
  end

  def random
    respond_with Merchant.random
  end

  def favorite_customer
    respond_with merchant.favorite_customer
  end

  def total_revenue
    if merchant_params[:date]
      respond_with merchant.total_revenue_by_date(merchant_params[:date])
    else
      respond_with merchant.total_revenue
    end
  end

  def customers_with_pending_invoices
    respond_with merchant.customers_with_pending_invoices
  end

  def most_revenue
    respond_with Merchant.most_revenue(params[:quantity].to_i)
  end

  def most_items
    respond_with Merchant.most_items(params[:quantity].to_i)
  end

  def revenue
    respond_with Merchant.revenue(params[:date])
  end

  private

  def merchant
    Merchant.find_by(id: params[:id])
  end

  def merchant_params
    params.permit(:id, :name, :created_at, :updated_at, :date)
  end
end
