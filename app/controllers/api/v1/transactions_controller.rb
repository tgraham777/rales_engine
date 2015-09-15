class Api::V1::TransactionsController < ApplicationController
  respond_to :json

  def show
    respond_with Transaction.find_by(id: params[:id])
  end

  def find
    if params.include?("invoice_id")
      respond_with Transaction.find_by(invoice_id: params[:invoice_id])
    elsif params.include?("credit_card_number")
      respond_with Transaction.find_by(credit_card_number: params[:credit_card_number])
    elsif params.include?("result")
      respond_with Transaction.find_by(result: params[:result])
    else
      respond_with Transaction.find_by(id: params[:id])
    end
  end
end
