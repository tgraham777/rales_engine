class Api::V1::InvoiceItemsController < ApplicationController
  respond_to :json
<<<<<<< HEAD

  def show
    respond_with InvoiceItem.find_by(id: params[:id])
  end

  def find
    if params.include?("item_id")
      respond_with InvoiceItem.find_by(item_id: params[:item_id])
    elsif params.include?("invoice_id")
      respond_with InvoiceItem.find_by(invoice_id: params[:invoice_id])
    elsif params.include?("quantity")
      respond_with InvoiceItem.find_by(quantity: params[:quantity])
    elsif params.include?("unit_price")
      respond_with InvoiceItem.find_by(unit_price: params[:unit_price])
    else
      respond_with InvoiceItem.find_by(id: params[:id])
    end
  end
=======
>>>>>>> master
end
