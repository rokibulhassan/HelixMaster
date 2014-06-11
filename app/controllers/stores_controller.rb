class StoresController < ApplicationController
  def search
    if params[:city].present?
      @stores = Location.by_city(params[:city])
    else
      @stores = Location.search(params[:country], params[:state], params[:city], params[:area])
    end
    respond_to do |format|
      format.js
    end
  end
end
