class OrdersController < ApplicationController
  def new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def post_back
    respond_to do |format|
      format.html
      format.js
    end
  end
end
