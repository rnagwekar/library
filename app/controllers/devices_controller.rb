class DevicesController < ApplicationController
  before_action :set_device, only: [:show, :edit, :update, :destroy]
  before_action :confirm_logged_in
  helper_method :getName, :getLenderName


  # GET /devices
  # GET /devices.json
  def index
    puts "***************** From index"
    @filter_location = params[:filter_location]
    @filter_owner = params[:filter_owner]

    @people = Person.pluck(:name, :id)
    @people.insert(0, "ALL")
    @location = Device::LOCATION
 
    if(@filter_location.nil?) 
      @devices = Device.all
   else
      #filter_location
      #Todo: this code needs to be refactored properly*******************
      if(@filter_location == "ALL" and @filter_owner == "ALL")
        @devices = Device.all
      else
        if (@filter_location == "ALL")
          @devices = Device.where(["person_id = ?", @filter_owner])
        else
          if (@filter_owner == "ALL")
            @devices = Device.where(["location = ?", @filter_location])
          else
            @devices = Device.where(["location = ? and person_id = ?", @filter_location, @filter_owner])
          end
        end
      end        
    end
  end

  def showdevices
    puts "***************** From filter"
    puts "From filter"
    p @filter_location
  end

  def getLenderName(pid)
    name = getName(pid) 
    if !name.empty?
      return name
    else
      "Available"
    end
  end

  def getName(pid)
    if (pid)
      Person.find_by(id: pid).name
    else
      ""
    end  
  end

  # GET /devices/1
  # GET /devices/1.json
  def show
    puts "***************** From show"
    if @device.person_id
      @person = Person.find_by(id: @device.person_id).name
      @people = Person.pluck(:name, :id)

    end
  end

  # GET /devices/new
  def new
    puts "***************** From new"
    @device = Device.new
    @people = Person.pluck(:name, :id)
    @category = Device::CATEGORY
    @location = Device::LOCATION
  end

  # GET /devices/1/edit
  def edit
    puts "***************** From edit"
      @people = Person.pluck(:name, :id)
      @category = Device::CATEGORY
      @location = Device::LOCATION
  end

  # POST /devices
  # POST /devices.json
  def create
    puts "***************** From create"
    @device = Device.new(device_params)

    respond_to do |format|
      if @device.save
        format.html { redirect_to @device, notice: 'Device was successfully created.' }
        format.json { render :show, status: :created, location: @device }
      else
        format.html { render :new }
        format.json { render json: @device.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /devices/1
  # PATCH/PUT /devices/1.json
  def update
    puts "***************** From update"
    respond_to do |format|
      if @device.update(device_params)
        format.html { redirect_to @device, notice: 'Device was successfully updated.' }
        format.json { render :show, status: :ok, location: @device }
      else
        format.html { render :edit }
        format.json { render json: @device.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /devices/1
  # DELETE /devices/1.json
  def destroy
    @device.destroy
    respond_to do |format|
      format.html { redirect_to devices_url, notice: 'Device was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_device
      puts "***************** From Set device"
      @device = Device.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def device_params
      params.require(:device).permit(:device_id, :company, :name, :lent_by, :team, :location, :category, :info, :person_id)
      #params.require(:filter_location, :filter_owner)
    end
   
    # def set_filter
    #   puts "***************** From Set Filter"
    #   @filter_location = params[:filter_location]
    #   @filter_owner = params[:filter_owner]
    # end

end
