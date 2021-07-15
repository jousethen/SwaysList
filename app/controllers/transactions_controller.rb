class TransactionsController < ApplicationController
  def add_item
    if session[:cart]
      session[:cart] << params[:id]
    else
      session[:cart] = []
      session[:cart] << params[:id]
    end
  end
end
