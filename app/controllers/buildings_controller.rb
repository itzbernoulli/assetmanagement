class BuildingsController < ApplicationController
  before_action :set_building, only: [:show, :edit, :update, :destroy]
  before_action :authorize
  # GET /buildings
  # GET /buildings.json
  def index
    @buildings = Building.all
  end

  # GET /buildings/1
  # GET /buildings/1.json
  def show
  end

  # GET /buildings/new
  def new
    @building = Building.new
  end

  # GET /buildings/1/edit
  def edit
  end

  # POST /buildings
  # POST /buildings.json
  def create
    @building = Building.new(building_params)

    @building = set_descriptions(@building)

    respond_to do |format|
      if @building.save
        format.html { redirect_to @building, notice: 'Building was successfully created.' }
        format.json { render :show, status: :created, location: @building }
      else
        format.html { render :new }
        format.json { render json: @building.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /buildings/1
  # PATCH/PUT /buildings/1.json
  def update
    respond_to do |format|
      if @building.update(building_params)
        format.html { redirect_to @building, notice: 'Building was successfully updated.' }
        format.json { render :show, status: :ok, location: @building }
      else
        format.html { render :edit }
        format.json { render json: @building.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /buildings/1
  # DELETE /buildings/1.json
  def destroy
    @building.destroy
    respond_to do |format|
      format.html { redirect_to buildings_url, notice: 'Building was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_building
      @building = Building.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def building_params
      params.require(:building).permit(:owner, :address, :sqmt, :price, :subtype, :building_image)
    end

    def set_descriptions(building)
      case building.subtype
      when "house"
        building.description['rooms'] = params['building']['rooms']
        building.description['floors'] = params['building']['floors']
        building.description['air_conditioned'] = params['air_conditioned']
      when "complex"
        building.description['units'] = params['units']
      when "commercial"
        building.description['shops'] = params['shops']
        building.description['parking'] = params['units']
      end
      building
    end

  #   def common_params
  #     [:rooms, :floors]
  #  end
end
