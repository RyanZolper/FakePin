class PinsController < ApplicationController
  before_action :set_pin, only: [:show, :edit, :update, :destroy, :pinit, :pinning]
  before_action :authenticate_pin, only: [:update, :edit, :destroy]
  before_action :titlearray

  # GET /pins
  # GET /pins.json
  def index

    if params[:search]
      @pins = Pin.search(params[:search]).order("created_at DESC")
    else
      if request.fullpath.include?('pins/mypins')
        @pins = @current_user.pins.all
      else
        @pins = Pin.includes(:user).order("created_at DESC")
        logger.debug "All pins inspected: #{@pins.inspect}"
      end
    end
  end

  # GET /pins/1
  # GET /pins/1.json
  def show
  end

  def titlearray
    @titlearray = Array.new
    @arraypins = Pin.all
    @arraypins.each do |pin|
      @titlearray << pin.title
    end
  end

  # GET /pins/new
  def new
    @pin = Pin.new
  end

  # GET /pins/1/edit
  def edit
  end

  def pinit
    @boards = @current_user.boards.all
  end

  def pinning
    if @pin.board_id != nil
      redirect_to pins_path, notice: "Pinned!"
    end
  end

  # POST /pins
  # POST /pins.json


  def create
    @pin = @current_user.pins.new(pin_params)

    respond_to do |format|
      if @pin.save
        format.html { redirect_to @pin, notice: 'Pin was successfully created.' }
        format.json { render :show, status: :created, location: @pin }
      else
        format.html { render :new }
        format.json { render json: @pin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pins/1
  # PATCH/PUT /pins/1.json
  def update
    respond_to do |format|
        if @pin.update(pin_params)
          format.html { redirect_to @pin, notice: 'Pin was successfully updated.' }
          format.json { render :show, status: :ok, location: @pin }
        else
          format.html { render :edit }
          format.json { render json: @pin.errors, status: :unprocessable_entity }
        end
    end
  end

  # DELETE /pins/1
  # DELETE /pins/1.json
  def destroy
    @pin.destroy
    respond_to do |format|
      format.html { redirect_to pins_url, notice: 'Pin was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pin
      @pin = Pin.find(params[:id])
    end



    def authenticate_pin
      if params[:pin].keys != ["board_id"]
        if @pin.user_id != current_user.id
          if @current_user.admin != true
            redirect_to pins_path
            flash[:notice] = "Access Denied!"
          end
        end
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pin_params
      params.require(:pin).permit(:title, :description, :url, :pinimage, :user_id, :board_id)
    end
end
