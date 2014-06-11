class LocationTypesController < ApplicationController
  def index
    @location_types = LocationType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @location_types }
    end
  end

  def show
    @location_type = LocationType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @location_type }
    end
  end

  def new
    @location_type = LocationType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @location_type }
    end
  end

  def edit
    @location_type = LocationType.find(params[:id])
  end

  def create
    @location_type = LocationType.new(params[:location_type])

    respond_to do |format|
      if @location_type.save
        format.html { redirect_to @location_type, notice: 'Location type was successfully created.' }
        format.json { render json: @location_type, status: :created, location: @location_type }
      else
        format.html { render action: "new" }
        format.json { render json: @location_type.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @location_type = LocationType.find(params[:id])

    respond_to do |format|
      if @location_type.update_attributes(params[:location_type])
        format.html { redirect_to @location_type, notice: 'Location type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @location_type.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @location_type = LocationType.find(params[:id])
    @location_type.destroy

    respond_to do |format|
      format.html { redirect_to location_types_url }
      format.json { head :no_content }
    end
  end
end
