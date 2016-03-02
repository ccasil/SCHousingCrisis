class GeolocsController < ApplicationController
  before_action :set_geoloc, only: [:show, :edit, :update, :destroy]

  # GET /geolocs
  # GET /geolocs.json
  def index
    @geolocs = Geoloc.all
    gon.rabl
  end

  # GET /geolocs/1
  # GET /geolocs/1.json
  def show

  end

  # GET /geolocs/new
  def new
    @geoloc = Geoloc.new
  end

  # GET /geolocs/1/edit
  def edit
  end

  # POST /geolocs
  # POST /geolocs.json
  def create
    @geoloc = Geoloc.new(geoloc_params)

    respond_to do |format|
      if @geoloc.save
        format.html { redirect_to @geoloc, notice: 'Geoloc was successfully created.' }
        format.json { render :show, status: :created, location: @geoloc }
      else
        format.html { render :new }
        format.json { render json: @geoloc.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /geolocs/1
  # PATCH/PUT /geolocs/1.json
  def update
    respond_to do |format|
      if @geoloc.update(geoloc_params)
        format.html { redirect_to @geoloc, notice: 'Geoloc was successfully updated.' }
        format.json { render :show, status: :ok, location: @geoloc }
      else
        format.html { render :edit }
        format.json { render json: @geoloc.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /geolocs/1
  # DELETE /geolocs/1.json
  def destroy
    @geoloc.destroy
    respond_to do |format|
      format.html { redirect_to geolocs_url, notice: 'Geoloc was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_geoloc
      @geoloc = Geoloc.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def geoloc_params
      params.require(:geoloc).permit(:address, :city, :state, :zip, :g_lat, :g_lon, :g_side, :g_type, :g_side)
    end
end
