class ListingsController < ApplicationController
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end
  before_action :set_listing, only: [:show, :edit, :update, :destroy, :upvote]
  before_filter :authenticate_user!, except: [:index, :show]
  load_and_authorize_resource
   include CanCan::ControllerAdditions

  # GET /listings
  # GET /listings.json
  def index
        @search = Listing.ransack(params[:q])
        @listings = @search.result
        @search.build_condition
        @hash = Gmaps4rails.build_markers(@listings) do |listing, marker|
          marker.lat listing.latitude
          marker.lng listing.longitude
          marker.infowindow listing.street
        end
  end

  # GET /listings/1
  # GET /listings/1.json
  def show
  end

  # GET /listings/new
  def new

    @listing = current_user.listings.build
  end

  # GET /listings/1/edit
  def edit
  end

  # POST /listings
  # POST /listings.json
  def create
    @listing = current_user.listings.build(listing_params)



    respond_to do |format|
      if @listing.save
        format.html { redirect_to @listing, notice: 'Listing was successfully created.' }
        format.json { render :show, status: :created, location: @listing }
      else
        format.html { render :new }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /listings/1
  # PATCH/PUT /listings/1.json
  def update
    respond_to do |format|
      if @listing.update(listing_params)
        format.html { redirect_to @listing, notice: 'Listing was successfully updated.' }
        format.json { render :show, status: :ok, location: @listing }
      else
        format.html { render :edit }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /listings/1
  # DELETE /listings/1.json
  def destroy
    @listing.destroy
    respond_to do |format|
      format.html { redirect_to listings_url, notice: 'Listing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def upvote
    @listing = Listing.find(params[:id])
    @listing.upvote_by current_user
    redirect_to :back
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listing
      @listing = Listing.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def listing_params
      params.require(:listing).permit(:name, :phone, :email, :street, :city, :state, :zip, :priceperm, :latitude, :longitude, :description)
    end
end
