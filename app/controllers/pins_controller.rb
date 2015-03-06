class PinsController < InheritedResources::Base





  def index
    if params[:search]
      @pins = Pin.search(params[:search]).order("created_at DESC")
    else
      if request.fullpath.include?('pins/mypins')
        @pins = Pin.mypins.order("created_at DESC")
      else
        @pins = Pin.order("created_at DESC")
      end
    end
  end






  #def create
  #  @pin = Pin.new(pin_params)
  #  @pin.user_id = 1
  #end

  private

    def pin_params
      params.require(:pin).permit(:title, :description, :url, :pinimage, :page, :user_id, :board_id, :pin_image)
    end

    def current_user
      @current_user ||= User.last
    end


  #protected



    #def begin_of_association_chain
    # @begin_of_association_chain ||= current_user
    #end

    #def paginate
    #  @pins = Pin.order(:title).page params[:page]
    #end
end
