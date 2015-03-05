class BoardsController < InheritedResources::Base

  def addpin
    @boards = Board.all
    
  end

  private

    def board_params
      params.require(:board).permit(:name, :pins, :list)
    end
end
